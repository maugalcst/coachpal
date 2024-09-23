import 'package:flutter/material.dart';
import 'training_selection_page.dart';  // Página de rutinas
import 'favorite_routines_page.dart';   // Página de rutinas favoritas
import 'tutorials_page.dart';           // Página de tutoriales (se pospone por ahora)

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Lista de páginas para la navegación
  final List<Widget> _pages = [
    TrainingSelectionPage(),  // Página de selección de rutinas
    FavoriteRoutinesPage(),   // Página de rutinas favoritas
    TutorialsPage(),          // Página de tutoriales (pospuesta)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Rutinas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Tutoriales',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
