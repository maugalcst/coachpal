import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoachPal'),
      ),
      body: Center(
        child: Text(
          'Bienvenido a CoachPal',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
