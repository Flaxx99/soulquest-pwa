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
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Consumer<CharacterProvider>(
            builder: (context, provider, child) {
              if (provider.characterData == null) {
                return CircularProgressIndicator(color: Color(0xFF6AFFED));
              }
              if (provider.characterData!.isEmpty) {
                return Text(
                  "No se encontraron datos del personaje.",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                  textAlign: TextAlign.center,
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 📌 Imagen del personaje en la parte superior
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF6AFFED), width: 2),
                      image: DecorationImage(
                        image: AssetImage('assets/characters/character_1.png'), // Imagen del personaje
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Tarjeta con datos del personaje
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF6AFFED), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF6AFFED).withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          provider.characterData!['nombre'],
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6AFFED),
                            shadows: [Shadow(color: Color(0xFF6AFFED), blurRadius: 5)],
                          ),
                        ),
                        SizedBox(height: 10),

                        // 🏆 Barra de progreso de experiencia
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Progreso al siguiente nivel",
                              style: TextStyle(fontSize: 16, color: Colors.white70),
                            ),
                            SizedBox(height: 5),
                            LinearProgressIndicator(
                              value: provider.characterData!['experiencia'] / 100, // Suponiendo que 100 es el máximo
                              backgroundColor: Colors.grey[800],
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6AFFED)),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),
                        _buildCharacterStat("❤️ Vida", provider.characterData!['vida'].toString(), Colors.redAccent),
                        _buildCharacterStat("🔮 Maná", provider.characterData!['mana'].toString(), Colors.cyanAccent),
                        _buildCharacterStat("📊 Nivel", provider.characterData!['nivel'].toString(), Colors.greenAccent),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Botón de actualización con efecto neón azul
                  _buildUpdateButton(context),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// **Widget para mostrar estadísticas con color personalizado**
  Widget _buildCharacterStat(String title, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  /// **Botón de actualización con efecto neón azul**
  Widget _buildUpdateButton(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: Tween<double>(begin: 1.0, end: 1.05),
      builder: (context, double scale, child) {
        return InkWell(
          onTap: () {
            Provider.of<CharacterProvider>(context, listen: false).fetchCharacter(characterId);
          },
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF6AFFED), width: 2),
                boxShadow: [
                  BoxShadow(color: Color(0xFF6AFFED).withOpacity(0.5), blurRadius: 15),
                ],
              ),
              child: Center(
                child: Text(
                  "🔄 Actualizar Datos",
                  style: TextStyle(fontSize: 18, color: Color(0xFF6AFFED), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}