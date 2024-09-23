import 'package:flutter/material.dart';
import 'dashboard_page.dart'; // Importamos la página del dashboard

class InfoSlides extends StatefulWidget {
  @override
  _InfoSlidesState createState() => _InfoSlidesState();
}

class _InfoSlidesState extends State<InfoSlides> {
  final PageController _pageController = PageController(); // Controlador para las páginas de los slides
  int _currentPage = 0;

  // Lista de datos para los slides
  final List<Map<String, String>> _slides = [
    {
      'title': '¿Qué es CoachPal?',
      'description': 'CoachPal es una app diseñada para crear rutinas personalizadas, adaptadas a las capacidades de todos.',
    },
    {
      'title': '¿Para quién es?',
      'description': 'CoachPal está hecha para personas normales y personas con discapacidades físicas que buscan mantenerse activas.',
    },
    {
      'title': 'Funciones innovadoras',
      'description': 'CoachPal incluye rutinas adaptadas, seguimiento del progreso y recompensas para motivarte a alcanzar tus metas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Asegúrate de que aquí redirigimos al DashboardPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardPage()), // Verifica que DashboardPage sea el destino correcto
              );
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
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _slides[index]['title']!,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _slides[index]['description']!,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Indicadores de página
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_slides.length, (index) {
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

          // Botón "Continuar"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == _slides.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()), // Redirigir al Dashboard al finalizar las slides
                    );
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  _currentPage == _slides.length - 1 ? 'Comenzar' : 'Continuar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
