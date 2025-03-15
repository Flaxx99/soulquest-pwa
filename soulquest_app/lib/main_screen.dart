import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'info_screen.dart';
import 'levels_screen.dart';
import 'tips_screen.dart';
import 'news_screen.dart';
import 'character_screen.dart';

class MainScreen extends StatelessWidget {
  final String backgroundImage = "assets/images/banner.jpg"; // Puedes cambiar a banner.jpg o banner2.jpg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SoulQuest: Academy of Knowledge",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          // Capa de opacidad para mejorar la legibilidad
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),

          // Contenido Principal
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),

                // Noticias recientes con animación
                _buildNewsSection(),

                SizedBox(height: 20),

                // Botones del menú con animaciones
                _buildMenuButtons(context),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// **Sección de Noticias Recientes con animación**
  Widget _buildNewsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF6AFFED), width: 2), // Azul #6AFFED
      ),
      child: Column(
        children: [
          Text(
            "📰 Noticias Recientes",
            style: TextStyle(fontSize: 20, color: Color(0xFF6AFFED), fontWeight: FontWeight.bold), // Azul #6AFFED
          ),
          SizedBox(height: 10),
          Column(
            children: [
              _buildNewsItem("🔥 Nueva actualización de SoulQuest", "Descubre las nuevas misiones."),
              _buildNewsItem("🎭 Evento especial de Halloween", "Participa en el evento de temporada."),
            ],
          ).animate().fade(duration: 800.ms).slideY(begin: 0.3, curve: Curves.easeOut),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String description) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text(description, style: TextStyle(color: Colors.white70)),
      leading: Icon(Icons.article, color: Color(0xFF6AFFED)), // Azul #6AFFED
    );
  }

  /// **Menú de Botones con efecto neón #6AFFED**
  Widget _buildMenuButtons(BuildContext context) {
    return Column(
      children: [
        _buildNeonButton(context, "📖 Información del Juego", InfoScreen()),
        _buildNeonButton(context, "✅ Lista de Niveles", LevelsScreen()),
        _buildNeonButton(context, "💡 Pistas y Consejos", TipsScreen()),
        _buildNeonButton(context, "📢 Noticias y Actualizaciones", NewsScreen()),
        _buildNeonButton(context, "🛡 Datos del Personaje", CharacterScreen()),
      ],
    ).animate().fade(duration: 600.ms).scaleXY(begin: 0.9, end: 1.0);
  }

  /// **Botón con efecto neón #6AFFED**
  Widget _buildNeonButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFF6AFFED), width: 2), // Azul #6AFFED
            boxShadow: [
              BoxShadow(color: Color(0xFF6AFFED).withOpacity(0.5), blurRadius: 15), // Azul #6AFFED
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6AFFED), // Azul #6AFFED
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Color(0xFF6AFFED), blurRadius: 5)], // Azul #6AFFED
              ),
            ),
          ),
        ),
      ),
    ).animate().fade(duration: 500.ms).scaleXY(begin: 0.9, end: 1.0);
  }
}
