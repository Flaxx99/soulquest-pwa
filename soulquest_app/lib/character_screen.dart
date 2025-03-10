import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'character_provider.dart';

class CharacterScreen extends StatefulWidget {
  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final int characterId = 1; // ID del personaje

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CharacterProvider>(context, listen: false).fetchCharacter(characterId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos del Personaje"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Información del Personaje",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Consumer<CharacterProvider>(
              builder: (context, provider, child) {
                if (provider.characterData == null) {
                  return Center(child: CircularProgressIndicator(color: Colors.white));
                }
                if (provider.characterData!.isEmpty) {
                  return Center(
                    child: Text("No se encontraron datos del personaje.", style: TextStyle(color: Colors.white70)),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCharacterStat("🛡 Nombre", provider.characterData!['nombre']),
                    _buildCharacterStat("❤️ Vida", provider.characterData!['vida'].toString()),
                    _buildCharacterStat("🔮 Maná", provider.characterData!['mana'].toString()),
                    _buildCharacterStat("⭐ Experiencia", provider.characterData!['experiencia'].toString()),
                    _buildCharacterStat("📊 Nivel", provider.characterData!['nivel'].toString()),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  backgroundColor: Colors.grey[800],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Provider.of<CharacterProvider>(context, listen: false).fetchCharacter(characterId);
                },
                child: Text("Actualizar Datos", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterStat(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        "$title: $value",
        style: TextStyle(fontSize: 18, color: Colors.white70),
      ),
    );
  }
}
