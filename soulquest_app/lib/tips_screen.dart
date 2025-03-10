import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  final List<Map<String, String>> gameTips = [
    {
      "title": "🔹 Explora cada rincón",
      "description": "Algunas pistas y objetos clave están ocultos en lugares poco visibles. ¡No dejes nada sin revisar!"
    },
    {
      "title": "🔢 Usa la lógica en los acertijos",
      "description": "Los minijuegos pueden parecer difíciles, pero siempre hay una solución basada en el conocimiento."
    },
    {
      "title": "💾 Guarda tu progreso",
      "description": "Asegúrate de guardar la partida regularmente para evitar perder avances importantes."
    },
    {
      "title": "🕯 Ilumina las sombras",
      "description": "En ciertas áreas oscuras, encender una luz o resolver un enigma revelará caminos ocultos."
    },
    {
      "title": "👁 Observa los detalles",
      "description": "Algunos acertijos requieren prestar atención a los colores, números o patrones que parecen insignificantes."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pistas y Consejos"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Fondo oscuro
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Consejos para SoulQuest",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Aquí encontrarás pistas y consejos para superar los retos del juego.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: gameTips.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      leading: Icon(Icons.lightbulb, color: Colors.yellowAccent),
                      title: Text(
                        gameTips[index]["title"]!,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        gameTips[index]["description"]!,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
