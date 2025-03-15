import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> gameNews = [
    {
      "title": "🛠 Corrección de errores",
      "description": "Se han solucionado varios bugs que afectaban el rendimiento y la jugabilidad."
    },
    {
      "title": "👻 Modo terror mejorado",
      "description": "Se han agregado efectos de sonido y visuales para hacer la experiencia más inmersiva."
    },
    {
      "title": "🕵️‍♂️ Enemigos en nuevas áreas",
      "description": "Se han añadido más enemigos en diferentes partes del mapa para aumentar la dificultad."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias y Actualizaciones"),
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fondo con imagen
          Positioned.fill(
            child: Image.asset(
              'assets/images/banner.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Capa de opacidad
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      _buildNewsList(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// **Lista de Noticias con Tarjetas Animadas**
  Widget _buildNewsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: gameNews.map((news) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF6AFFED), width: 2), // Azul Aqua
                boxShadow: [
                  BoxShadow(color: Color(0xFF6AFFED).withOpacity(0.5), blurRadius: 10),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.article, color: Color(0xFF6AFFED)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          news["title"]!,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    news["description"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ).animate().fade(duration: 600.ms).slideY(begin: 0.2),
          );
        }).toList(),
      ),
    );
  }
}
