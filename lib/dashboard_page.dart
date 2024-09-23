import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Perfil del usuario
              _buildSectionTitle('Perfil del Usuario'),
              _buildProfileInfo(),

              SizedBox(height: 30),

              // Nueva sección de selección de rutinas
              _buildSectionTitle('Elige tu tipo de ejercicios'),

              SizedBox(height: 20),

              // Card para usuarios sin discapacidad
              _buildExerciseCard(
                context,
                title: 'Rutinas para Personas sin Discapacidad',
                description:
                    'Rutinas diseñadas para personas sin limitaciones físicas que buscan mejorar su fuerza, cardio o flexibilidad.',
                onPressed: () {
                  // Redirige a la selección de rutinas sin discapacidad
                  Navigator.pushNamed(context, '/normalUserHomePage');
                },
              ),

              SizedBox(height: 20),

              // Card para usuarios con discapacidad
              _buildExerciseCard(
                context,
                title: 'Rutinas para Personas con Discapacidad',
                description:
                    'Rutinas adaptadas para personas con movilidad reducida o discapacidades físicas, asegurando seguridad y efectividad.',
                onPressed: () {
                  // Redirige a la selección de rutinas con discapacidad
                  Navigator.pushNamed(context, '/lesionSelectionPage');
                },
              ),

              SizedBox(height: 30),

              // Objetivos de Entrenamiento
              _buildSectionTitle('Objetivos de Entrenamiento'),
              _buildObjectives(),

              SizedBox(height: 20),

              // Rutinas Guardadas
              _buildSectionTitle('Rutinas Guardadas'),
              _buildSavedRoutines(),

              SizedBox(height: 20),

              // Progreso y Recompensas
              _buildSectionTitle('Progreso y Recompensas'),
              _buildProgress(),
            ],
          ),
        ),
      ),
    );
  }

  // Título de cada sección
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  // Información del perfil del usuario
  Widget _buildProfileInfo() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(Icons.person, size: 40),
        title: Text('Nombre del Usuario'),
        subtitle: Text('Nivel: Intermedio'),
      ),
    );
  }

  // Objetivos del usuario
  Widget _buildObjectives() {
    return Column(
      children: [
        ListTile(
          title: Text('Perder peso'),
          subtitle: Text('Progreso: 70%'),
        ),
        ListTile(
          title: Text('Aumentar fuerza'),
          subtitle: Text('Progreso: 40%'),
        ),
      ],
    );
  }

  // Rutinas guardadas
  Widget _buildSavedRoutines() {
    return Column(
      children: [
        ListTile(
          title: Text('Rutina de Fuerza'),
          subtitle: Text('Favorita'),
          trailing: Icon(Icons.favorite, color: Colors.red),
        ),
        ListTile(
          title: Text('Cardio para principiantes'),
          subtitle: Text('Favorita'),
          trailing: Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }

  // Progreso y Recompensas
  Widget _buildProgress() {
    return Column(
      children: [
        ListTile(
          title: Text('Días entrenados: 5/7'),
        ),
        ListTile(
          title: Text('Recompensas alcanzadas: 2'),
        ),
      ],
    );
  }

  // Card personalizada que es completamente clicable
  Widget _buildExerciseCard(BuildContext context,
      {required String title,
      required String description,
      required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
