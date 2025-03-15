import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información del Juego"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Fondo oscuro
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 📌 Imagen de Encabezado (Asegúrate de agregarla en assets/images/banner.jpg)
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/banner.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black.withOpacity(0.6), // Oscurece la imagen
                  alignment: Alignment.center,
                  child: Text(
                    "SoulQuest: Academy of Knowledge",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6AFFED), // Azul Aqua
                      shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 📜 Descripción con colores anteriores
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Sumérgete en una academia llena de misterios y desafíos educativos. "
                "A medida que avanzas, enfrentarás pruebas en distintas materias "
                "que pondrán a prueba tu ingenio y conocimiento.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),

            SizedBox(height: 20),

            // 🔹 Sección de Características con Iconos en recuadros
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FeatureItem(
                    icon: Icons.book,
                    title: "Historia Envolvente",
                    description: "Descubre una historia con una temática misteriosa que te atrapará desde el inicio.",
                  ),
                  FeatureItem(
                    icon: Icons.school,
                    title: "Retos Educativos",
                    description: "Enfréntate a desafíos en diversas materias como matemáticas, ciencias y literatura.",
                  ),
                  FeatureItem(
                    icon: Icons.explore,
                    title: "Explora la Academia",
                    description: "Adéntrate en cada rincón de la academia y descubre sus secretos ocultos.",
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// 🎭 Widget Mejorado: Características dentro de un recuadro con botón de despliegue animado
class FeatureItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({required this.icon, required this.title, required this.description});

  @override
  _FeatureItemState createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem> {
  bool isExpanded = false; // Estado para manejar el despliegue de información

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF6AFFED), width: 2), // Azul Aqua
              boxShadow: [
                BoxShadow(color: Color(0xFF6AFFED).withOpacity(0.5), blurRadius: 10), // Azul Aqua
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon, color: Color(0xFF6AFFED), size: 28), // Azul Aqua
                    SizedBox(width: 10),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (isExpanded)
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ).animate().fade(duration: 300.ms),
                  ),
                SizedBox(height: 10),

                // 🔽 Botón con Flecha Animada en lugar del botón clásico
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: Duration(milliseconds: 300),
                    child: Icon(Icons.keyboard_arrow_down, size: 32, color: Color(0xFF6AFFED)), // Azul Aqua
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
