import 'package:flutter/material.dart';

class TutorialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutoriales (Próximamente)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'La funcionalidad de tutoriales estará disponible próximamente.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
