import 'package:flutter/cupertino.dart'; // Importa la librería Cupertino Icons
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    // Agrega aquí tus páginas o vistas
    Text('Página 1'),
    Text('Página 2'),
    Text('Página 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Navigation App'),
      ),
      body: _pages[_currentIndex], // Muestra la página actual
      bottomNavigationBar: CupertinoTabBar(
        // Usa CupertinoTabBar en lugar de BottomNavigationBar
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home), // Usa CupertinoIcons.home
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info), // Cambiado a CupertinoIcons.info
            label: 'Registro', // Cambiado de "Bussines" a "Registro"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), // Usa CupertinoIcons.person
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
