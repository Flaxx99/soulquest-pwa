import 'package:flutter/material.dart';

class LevelsScreen extends StatelessWidget {
  final List<String> gameLevels = [
    "📜 Nivel 1: El Despertar",
    "🕯 Nivel 2: La Biblioteca Encantada",
    "🔢 Nivel 3: Retos Numéricos",
    "🎭 Nivel 4: El Teatro de las Sombras",
    "🧩 Nivel 5: El Gran Enigma",
    "⚗ Nivel 6: El Laboratorio Perdido",
    "🗝 Nivel 7: La Cámara Secreta",
    "👁 Nivel 8: El Guardián del Conocimiento",
    "🔥 Nivel 9: Prueba Final",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Niveles"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black, // Fondo oscuro
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Niveles del Juego",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Estos son los niveles que podrás explorar en SoulQuest.",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: gameLevels.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      leading: Icon(Icons.videogame_asset, color: Colors.blueAccent),
                      title: Text(
                        gameLevels[index],
                        style: TextStyle(color: Colors.white),
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
