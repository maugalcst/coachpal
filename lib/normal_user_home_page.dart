import 'package:flutter/material.dart';

class NormalUserHomePage extends StatelessWidget {
  // Genera una lista de ejercicios estándar para usuarios sin discapacidades
  final List<String> routine = [
    'Ejercicio 1: Flexiones de brazos.',
    'Ejercicio 2: Sentadillas.',
    'Ejercicio 3: Abdominales.',
    'Ejercicio 4: Saltos de tijera.',
    'Ejercicio 5: Estiramiento de piernas y espalda.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutina de Entrenamiento'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rutina para: Usuario sin limitaciones físicas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: routine.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        routine[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
