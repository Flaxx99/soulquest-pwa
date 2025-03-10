import 'dart:convert';
import 'package:http/http.dart' as http;

class CharacterService {
  static const String apiUrl = "http://localhost:3000/getCharacter"; // Cambiar en producción

  Future<Map<String, dynamic>?> getCharacter(int id) async {
    final response = await http.get(Uri.parse("$apiUrl/$id"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
