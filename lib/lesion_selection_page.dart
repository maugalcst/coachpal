import 'package:flutter/material.dart';
import 'home_page.dart'; // Importa la página principal

class LesionSelectionPage extends StatelessWidget {
  final List<Map<String, String>> disabilities = [
    {'name': 'Silla de ruedas', 'description': 'Movilidad limitada en piernas, uso de silla de ruedas.'},
    {'name': 'Amputación de miembro superior', 'description': 'Falta de uno o ambos brazos.'},
    {'name': 'Amputación de miembro inferior', 'description': 'Falta de una o ambas piernas.'},
    {'name': 'Movilidad reducida en brazos', 'description': 'Dificultad para mover uno o ambos brazos.'},
    {'name': 'Movilidad reducida en piernas', 'description': 'Dificultad para mover una o ambas piernas.'},
    {'name': 'En cama (movilidad limitada)', 'description': 'Movilidad muy reducida, permanecer en cama.'},
    {'name': 'Problemas de equilibrio', 'description': 'Dificultad para mantener el equilibrio.'},
    {'name': 'Lesión medular parcial', 'description': 'Lesión en la médula espinal que afecta parcialmente la movilidad.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona tu condición'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: disabilities.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(
                  disabilities[index]['name']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(disabilities[index]['description']!),
                onTap: () {
                  // Redirige a la página principal pasando la discapacidad seleccionada
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        selectedDisability: disabilities[index]['name']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
