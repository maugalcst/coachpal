import 'package:flutter/material.dart';

class FavoriteRoutinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutinas Favoritas'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Aquí se mostrarán tus rutinas favoritas.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
