import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TipsScreen extends StatelessWidget {
  final List<Map<String, String>> gameTips = [
    {
      "title": "Huir de los enemigos",
      "description": "No siempre es necesario enfrentarte. A veces, huir es la mejor estrategia para sobrevivir."
    },
    {
      "title": "Piensa bien en cada acertijo",
      "description": "Tómate tu tiempo para analizar cada desafío. No te apresures a responder sin considerar todas las opciones."
    },
    {
      "title": "Completa cada nivel para avanzar",
      "description": "Cada nivel desbloquea nuevas oportunidades y desafíos. Asegúrate de cumplir con los objetivos antes de seguir adelante."
    },
    {
      "title": "Mantente alerta a tu alrededor",
      "description": "Los detalles más pequeños pueden ser clave para resolver un problema o encontrar un objeto importante."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pistas y Consejos"),
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
                      _buildTipsList(),
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

  /// **Lista de Pistas con Tarjetas Animadas**
  Widget _buildTipsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: gameTips.map((tip) {
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
                      Icon(Icons.lightbulb, color: Color(0xFF6AFFED)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          tip["title"]!,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    tip["description"]!,
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
