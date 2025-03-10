import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> gameNews = [
    {
      "title": "📢 Nueva actualización 1.2",
      "date": "10 de marzo de 2025",
      "description": "Se han añadido nuevos acertijos y mejorado la experiencia de juego en la Biblioteca Encantada."
    },
    {
      "title": "⚙️ Mejoras en la jugabilidad",
      "date": "5 de marzo de 2025",
      "description": "Ahora los minijuegos tienen pistas opcionales para ayudar a los jugadores en los desafíos más complejos."
    },
    {
      "title": "🎨 Actualización visual",
      "date": "28 de febrero de 2025",
      "description": "Se han mejorado los efectos de iluminación y se ha añadido más detalle a los escenarios oscuros."
    },
    {
      "title": "📜 Nuevo capítulo desbloqueado",
      "date": "20 de febrero de 2025",
      "description": "El nivel 'El Guardián del Conocimiento' ya está disponible para todos los jugadores."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias y Actualizaciones"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Fondo oscuro
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Últimas Noticias",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mantente informado sobre los cambios y mejoras en SoulQuest.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: gameNews.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      leading: Icon(Icons.new_releases, color: Colors.redAccent),
                      title: Text(
                        gameNews[index]["title"]!,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gameNews[index]["date"]!,
                            style: TextStyle(color: Colors.white54, fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(
                            gameNews[index]["description"]!,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
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
