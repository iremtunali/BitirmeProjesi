import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://c7b9-104-198-239-45.ngrok-free.app';  // ngrok URL'nizi buraya yazın

  // API'yi çağıran fonksiyon
  Future<Map<String, dynamic>> generateRecipe(String ingredients) async {
    final url = Uri.parse('$baseUrl/generate');

    // İstek gönderme
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'input_ingredients': ingredients}),  // Doğru anahtarı kullanın
    );

    if (response.statusCode == 200) {
      // Başarılı yanıt
      return jsonDecode(response.body);
    } else {
      // Hata durumu
      throw Exception('API çağrısı başarısız: ${response.statusCode}');
    }
  }
}
