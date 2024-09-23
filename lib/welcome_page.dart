import 'package:flutter/material.dart';
import 'info_slides.dart'; // Importa la página de slides
import 'user_type_selection_page.dart'; // Importa la página de selección de tipo de usuario

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Espaciado alrededor
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título o logo de la app
            Text(
              "Bienvenido a CoachPal",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center, // Centramos el texto
            ),
            SizedBox(height: 30), // Espaciado

            // Mensaje introductorio
            Text(
              "¡Gracias por unirte a CoachPal!\nEstamos aquí para ayudarte a mantenerte activo de manera segura y adaptada a tus necesidades.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40), // Espaciado

            // Botón "Comenzar"
            SizedBox(
              width: double.infinity, // Botón que ocupa todo el ancho
              child: ElevatedButton(
                onPressed: () {
                  // Navegamos a la pantalla de slides informativos
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoSlides()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16), // Aumentar la altura del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  ),
                  backgroundColor: Colors.blueAccent, // Color del botón
                ),
                child: Text(
                  "Comenzar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20), // Espaciado

            // Botón "Saltar" (opcional)
            TextButton(
              onPressed: () {
                // Saltamos directamente al selector de tipo de usuario
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => UserTypeSelectionPage()), // Ir a la página de selección
                );
              },
              child: Text(
                "Saltar",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
