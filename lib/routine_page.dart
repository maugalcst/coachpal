import 'package:flutter/material.dart';

class RoutinePage extends StatelessWidget {
  final String routineType;

  // Constructor que recibe el tipo de rutina seleccionada
  RoutinePage({required this.routineType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutina: $routineType'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Esta es la rutina para $routineType.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
