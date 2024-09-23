import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String selectedDisability;

  // Constructor para recibir la discapacidad seleccionada
  HomePage({required this.selectedDisability});

  // Método para generar la rutina según la discapacidad
  List<String> _generateRoutine(String disability) {
    switch (disability) {
      case 'Silla de ruedas':
        return [
          'Ejercicio 1: Elevaciones de brazos desde la silla.',
          'Ejercicio 2: Flexiones de torso sentado.',
          'Ejercicio 3: Estiramientos de hombros y cuello.',
        ];
      case 'Amputación de miembro superior':
        return [
          'Ejercicio 1: Flexiones de piernas.',
          'Ejercicio 2: Estiramientos de torso y piernas.',
          'Ejercicio 3: Ejercicios de movilidad de piernas.',
        ];
      case 'Amputación de miembro inferior':
        return [
          'Ejercicio 1: Flexiones de brazos con mancuernas.',
          'Ejercicio 2: Elevaciones de torso.',
          'Ejercicio 3: Ejercicios de fuerza en brazos.',
        ];
      case 'Movilidad reducida en brazos':
        return [
          'Ejercicio 1: Flexiones de piernas en el suelo.',
          'Ejercicio 2: Estiramientos de espalda y piernas.',
          'Ejercicio 3: Ejercicios de piernas desde una silla.',
        ];
      case 'Movilidad reducida en piernas':
        return [
          'Ejercicio 1: Elevaciones de brazos con peso.',
          'Ejercicio 2: Flexiones de torso.',
          'Ejercicio 3: Movilidad de brazos y hombros.',
        ];
      case 'En cama (movilidad limitada)':
        return [
          'Ejercicio 1: Movimientos circulares de tobillos.',
          'Ejercicio 2: Flexiones suaves de piernas en cama.',
          'Ejercicio 3: Estiramientos de brazos y torso desde cama.',
        ];
      case 'Problemas de equilibrio':
        return [
          'Ejercicio 1: Ejercicios de equilibrio sentado.',
          'Ejercicio 2: Movilidad de piernas y brazos sentado.',
          'Ejercicio 3: Movilidad suave de cuello y hombros.',
        ];
      case 'Lesión medular parcial':
        return [
          'Ejercicio 1: Estiramientos suaves de piernas.',
          'Ejercicio 2: Flexiones de torso sentado.',
          'Ejercicio 3: Ejercicios de brazos y hombros.',
        ];
      default:
        return [
          'Ejercicio 1: Estiramiento general.',
          'Ejercicio 2: Movilidad de piernas y brazos.',
          'Ejercicio 3: Flexiones suaves.',
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generamos la rutina basada en la discapacidad seleccionada
    List<String> routine = _generateRoutine(selectedDisability);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Rutina Personalizada'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rutina para: $selectedDisability',
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
