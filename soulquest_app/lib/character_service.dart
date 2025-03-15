import 'dart:convert';
import 'package:http/http.dart' as http;

class CharacterService {
  static const String apiUrl = "https://backend-pwa-nub7.onrender.com/getCharacter"; // URL en producción

  Future<Map<String, dynamic>?> getCharacter(int id) async {
    try {
      final response = await http.get(Uri.parse("$apiUrl/$id"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("❌ Error en la API: ${response.statusCode}");
      }
    } catch (error) {
      print("❌ Error al conectar con la API: $error");
    }
    return null;
  }
}
