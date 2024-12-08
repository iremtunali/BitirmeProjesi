import 'package:flutter/material.dart';
import 'package:giris_ekrani/page/login.dart';
import 'package:giris_ekrani/page/signup.dart';
import 'api_service.dart';  // API servis dosyasını import et

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SavorFusion',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SignUp(),  // HomePage'i başlangıç sayfası olarak ayarladım
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();  // API servis sınıfını başlatıyoruz
  String result = 'Tarif sonuçları burada görünecek';  // Başlangıç metni

  // API'yi çağıran fonksiyon
  void _getRecipe() async {
    try {
      final response = await apiService.generateRecipe('domates, salatalık, biber');  // Örnek malzemeler
      setState(() {
        result = response['recipe'] ?? 'Tarif bulunamadı';  // API'den dönen tarifi göster
      });
    } catch (e) {
      setState(() {
        result = 'Hata: $e';  // Hata mesajını göster
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SavorFusion'),  // Uygulama başlığı
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _getRecipe,  // Butona tıklanınca tarif ara fonksiyonunu çağırıyoruz
              child: Text('Tarif Ara'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
            ),
            SizedBox(height: 20),
            Text(
              result,  // API'den alınan sonucu buraya yazıyoruz
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
