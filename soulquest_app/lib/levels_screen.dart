import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LevelsScreen extends StatelessWidget {
  final List<Map<String, String>> gameLevels = [
    {
      "title": "Nivel 1: Ecos del Lenguaje",
      "description": "Dentro de un libro antiguo encantado, el jugador debe descubrir palabras ocultas dentro de otras palabras. Este desafío refuerza la comprensión del lenguaje y la habilidad para identificar patrones lingüísticos."
    },
    {
      "title": "Nivel 2: Llamas del Desafío",
      "description": "Un desafío de reflejos y estrategia en el gimnasio de la academia. Los jugadores deben esquivar y lanzar proyectiles de energía espectral en un duelo contra un rival. Solo aquellos con rapidez y precisión lograrán vencer."
    },
    {
      "title": "Nivel 3: Sombras del Conocimiento",
      "description": "El jugador debe usar piezas de tangram para formar figuras ocultas en las sombras de la biblioteca. Cada figura representa un concepto clave del conocimiento, poniendo a prueba la capacidad de observación y la lógica del jugador."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Niveles"),
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

          // Contenido Principal
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      _buildLevelsList(),
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

  /// **Lista de Niveles con Descripción**
  Widget _buildLevelsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: gameLevels.map((level) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.videogame_asset, color: Color(0xFF6AFFED)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          level["title"]!,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    level["description"]!,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    textAlign: TextAlign.center,
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
