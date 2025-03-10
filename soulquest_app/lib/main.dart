import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_screen.dart'; // Importar la pantalla principal
import 'character_provider.dart';

void main() {
  runApp(SoulQuestApp());
}

class SoulQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CharacterProvider()), // Agregar Provider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: MainScreen(), // Aquí debe estar la pantalla principal
      ),
    );
  }
}
