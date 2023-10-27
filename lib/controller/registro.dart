import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vinto/Service/servicios.dart';

class RegistroController extends GetxController {
  final isLoading = false.obs;

  Future<void> registro({
    required String nombre,
    required String email,
    required String password,
    required String numero_telefono,
    required int rol_id,
  }) async {
    isLoading.value = true;

    // Verificar la conectividad antes de realizar la solicitud
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print('No tienes acceso a internet');
      isLoading.value = false;
      return;
    }

    var data = {
      "nombre": nombre,
      "email": email,
      "password": password,
      "numero_telefono": numero_telefono,
      "rol_id": rol_id,
    };

    try {
      var response = await http.post(
        Uri.parse(url + 'users'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        // Agrega aquí la lógica para manejar una respuesta exitosa
      } else {
        print('Error: ${response.reasonPhrase}');
        // Agrega aquí la lógica para manejar un error de solicitud
      }
    } catch (e) {
      print('Error: $e');
      // Agrega aquí la lógica para manejar errores de red u otros errores
    } finally {
      isLoading.value = false;
    }
  }
}
