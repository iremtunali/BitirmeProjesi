import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menü Ayarları'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildInputField('Porsiyon Boyutu (1, 2, 3, 4 vb.)', context),
          _buildInputField('Mutfak (Türk, Çin, Fransız vb.)', context),
          _buildInputField('Zorluk Derecesi (Kolay, Orta, Zor)', context),
          _buildInputField('Diyet Tercihleri (Vejetaryen, vb.)', context),
          _buildInputField('Yapılış Süresi (40 dk, 60 dk vb.)', context),
          _buildInputField('Öğün Zamanı (Kahvaltı, Öğle Yemeği vb.)', context),
          // Kaydet Butonu
          ElevatedButton(
            onPressed: () {
              // Kaydetme işlemleri buraya yazılabilir
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Bilgiler Kaydedildi'),
                  content: Text('Menü bilgileri başarıyla kaydedildi.'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Tamam'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: Text('Kaydet'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String hint, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
