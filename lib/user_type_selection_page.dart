import 'package:flutter/material.dart';
import 'lesion_selection_page.dart'; // Importa la página de selección de discapacidades
import 'main_page.dart'; // Importa la página con la barra inferior (navbar)

class UserTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personaliza tu experiencia de entrenamiento'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Elige la opción que mejor se ajuste a ti:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),

            // Botón para "Sin discapacidades"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Redirige a la nueva página con la barra inferior (navbar) para usuarios sin discapacidades
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()), // Redirige a la pantalla con la barra inferior
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  "Sin discapacidades",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Botón para "Con alguna discapacidad"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Redirige a la página de selección de lesiones/discapacidades
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LesionSelectionPage()), // Página para usuarios con discapacidad
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  "Con alguna discapacidad",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
