import 'package:flutter/material.dart';

class WelcomeAndSurveySlides extends StatefulWidget {
  @override
  _WelcomeAndSurveySlidesState createState() => _WelcomeAndSurveySlidesState();
}

class _WelcomeAndSurveySlidesState extends State<WelcomeAndSurveySlides> {
  final PageController _pageController = PageController(); // Controlador de PageView
  int _currentPage = 0;

  // Controladores de texto para edad y peso
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  // Variables para almacenar las respuestas de la encuesta
  String? userType;
  int? age;
  double? weight;
  String? mainGoal;

  // Opciones para el tipo de usuario
  final List<String> userTypes = ['Sin discapacidad', 'Con discapacidad'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('CoachPal'),
        backgroundColor: Colors.blueAccent,
        actions: [
          if (_currentPage < 3) // Solo mostrar el botón de saltar en las slides de bienvenida
            TextButton(
              onPressed: () {
                _pageController.jumpToPage(3); // Saltar directamente a las slides de encuesta
              },
              child: Text(
                'Saltar',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // Slides de bienvenida
                _buildWelcomeSlide('¿Qué es CoachPal?', 'CoachPal es una app diseñada para crear rutinas personalizadas, adaptadas a las capacidades de todos.'),
                _buildWelcomeSlide('¿Para quién es?', 'CoachPal está hecha para personas normales y personas con discapacidades físicas que buscan mantenerse activas.'),
                _buildWelcomeSlide('Funciones innovadoras', 'CoachPal incluye rutinas adaptadas, seguimiento del progreso y recompensas para motivarte a alcanzar tus metas.'),

                // Slides de la encuesta
                _buildUserTypeSlide(),
                _buildAgeWeightSlide(),
                _buildGoalSlide(),
              ],
            ),
          ),

          // Indicadores de página
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blueAccent : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),

          SizedBox(height: 20),

          // Botones de navegación
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Anterior'),
                  ),
                if (_currentPage < 5)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Siguiente'),
                  ),
                if (_currentPage == 5)
                  ElevatedButton(
                    onPressed: () {
                      // Guardar los datos ingresados
                      age = int.tryParse(_ageController.text);
                      weight = double.tryParse(_weightController.text);

                      // Aquí puedes manejar el envío de los datos a la base de datos

                      // Redirigir a la página de rutinas
                      Navigator.pushReplacementNamed(context, '/routines');
                    },
                    child: Text('Finalizar'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Construir cada slide de la bienvenida
  Widget _buildWelcomeSlide(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Slide de selección de tipo de usuario
  Widget _buildUserTypeSlide() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '¿Eres una persona con alguna discapacidad?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ...userTypes.map((type) {
            return RadioListTile<String>(
              title: Text(type),
              value: type,
              groupValue: userType,
              onChanged: (value) {
                setState(() {
                  userType = value;
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  // Slide combinado de edad y peso
  Widget _buildAgeWeightSlide() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Datos Básicos',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Campo para la edad
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Edad',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20), // Espaciado entre los campos

          // Campo para el peso
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Peso (kg)',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // Slide de objetivo principal
  Widget _buildGoalSlide() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '¿Cuál es tu objetivo principal?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: mainGoal,
            hint: Text('Selecciona tu objetivo'),
            items: ['Perder peso', 'Ganar fuerza', 'Mejorar flexibilidad']
                .map((goal) {
              return DropdownMenuItem<String>(
                value: goal,
                child: Text(goal),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                mainGoal = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
