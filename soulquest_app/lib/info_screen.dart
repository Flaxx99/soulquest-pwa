import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información del Juego"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Fondo oscuro
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SoulQuest: Academy of Knowledge",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Sumérgete en una academia llena de misterios y desafíos educativos. "
              "A medida que avanzas, enfrentarás pruebas en distintas materias "
              "que pondrán a prueba tu ingenio y conocimiento.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              "Características del Juego:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            _buildFeature("🔹 Historia envolvente con temática de terror."),
            _buildFeature("🔹 Retos educativos en diversas materias."),
            _buildFeature("🔹 Progresión visual: de oscuro a iluminado."),
            _buildFeature("🔹 Explora la academia y descubre sus secretos."),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white70),
      ),
    );
  }
}
