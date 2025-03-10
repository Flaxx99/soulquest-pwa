import 'package:flutter/material.dart';
import 'character_service.dart';

class CharacterProvider with ChangeNotifier {
  Map<String, dynamic>? characterData;
  final CharacterService _service = CharacterService();

  Future<void> fetchCharacter(int id) async {
    characterData = await _service.getCharacter(id);
    notifyListeners();
  }
}
