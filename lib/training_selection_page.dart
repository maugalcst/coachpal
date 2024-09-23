import 'package:flutter/material.dart';
import 'routine_page.dart'; // Importa la página donde se mostrará la rutina específica

class TrainingSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elige tu entrenamiento'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Encabezado de Fuerza
            Text(
              'Fuerza',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTrainingCards(context, [
              'PPL (Push, Pull, Legs)',
              'Brazos',
              'Piernas',
              'Torso',
              'Abdomen',
              'Cuerpo Completo'
            ]),

            SizedBox(height: 30),

            // Encabezado de Cardio
            Text(
              'Cardio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTrainingCards(context, ['Cardio de alta intensidad', 'Cardio de bajo impacto']),

            SizedBox(height: 30),

            // Encabezado de HIIT
            Text(
              'HIIT (High-Intensity Interval Training)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTrainingCards(context, ['HIIT Básico', 'HIIT Intermedio', 'HIIT Avanzado']),

            SizedBox(height: 30),

            // Encabezado de Flexibilidad
            Text(
              'Flexibilidad',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTrainingCards(context, ['Movilidad de espalda', 'Movilidad de piernas', 'Estiramientos de cuerpo completo']),
          ],
        ),
      ),
    );
  }

  // Método para generar las cards
  Widget _buildTrainingCards(BuildContext context, List<String> options) {
    return Column(
      children: options.map((option) {
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(
              option,
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Al seleccionar una opción, navega a la página donde se mostrará la rutina específica
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoutinePage(
                    routineType: option, // Pasamos la opción seleccionada a la página de rutina
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
