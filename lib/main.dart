import 'package:flutter/material.dart';
import 'package:vinto/pages/login.dart';
import 'package:vinto/pages/principal.dart';
import 'package:vinto/pages/registrar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login', // Define la ruta inicial como '/login'
      routes: {
        'login': (BuildContext context) => LoginScreen(),
        'principal': (BuildContext context) => MyNavigationBar(),
        'registrar': (BuildContext context) => RegisterScreen(),
      },
    );
  }
}
