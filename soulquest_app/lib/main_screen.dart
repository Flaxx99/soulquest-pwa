import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'levels_screen.dart';
import 'tips_screen.dart';
import 'news_screen.dart';
import 'character_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SoulQuest: Academy of Knowledge"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Fondo oscuro
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/sq_bg.jpg', // Imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6), // Efecto de difuminado
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(context, "📖 Información del Juego", InfoScreen()),
                _buildMenuButton(context, "✅ Lista de Niveles", LevelsScreen()),
                _buildMenuButton(context, "💡 Pistas y Consejos", TipsScreen()),
                _buildMenuButton(context, "📢 Noticias y Actualizaciones", NewsScreen()),
                _buildMenuButton(context, "🛡 Datos del Personaje", CharacterScreen()), // Nueva opción
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          backgroundColor: Colors.grey[800], // Botón con fondo oscuro
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
