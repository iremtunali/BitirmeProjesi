import 'package:giris_ekrani/widget/widget_support.dart';
import 'package:flutter/material.dart';
import '../widget/widget_support.dart';
import 'menu.dart'; // Menü sayfasını içeren dosyayı import edin.
import 'favorite.dart'; // Favori sayfasını içeren dosyayı import edin.
import 'bottomnav.dart'; // BottomNav widget'ını içeren dosyayı ekleyin.

void main() {
  runApp(SavorFusionApp());
}

class SavorFusionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SavorFusion',
      theme: ThemeData(primarySwatch: Colors.red),
      home: BottomNav(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool> _expanded = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SavorFusion'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child:
                    Image.network(
                      'https://plus.unsplash.com/premium_photo-1673108852141-e8c3c22a4a22?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Icon(Icons.restaurant_menu, size: 50, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Elde bulunan malzemelerle en iyi tarifleri keşfedin!',
                      style: AppWidget.boldTextFeildStyle()
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _buildCategories(),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text('Tarif Ara'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategories() {
    final categories = {
      'Sebzeler': ['Domates', 'Salatalık', 'Sivri Biber', 'Patlıcan'],
      'Süt Ürünleri': ['Süt', 'Peynir', 'Yoğurt', 'Tereyağ'],
      'Baklagiller': ['Nohut', 'Mercimek', 'Fasulye', 'Barbunya'],
      'Makarna ve Buğday Ürünleri': ['Makarna', 'Bulgur', 'Un', 'Erişte'],
      'Hayvansal Gıdalar': ['Tavuk', 'Kırmızı Et', 'Balık', 'Yumurta'],
    };

    return categories.entries.map((entry) {
      final category = entry.key;
      final items = entry.value;

      _expanded[category] = _expanded[category] ?? false;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              category,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              _expanded[category]! ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                _expanded[category] = !_expanded[category]!;
              });
            },
          ),
          if (_expanded[category]!)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: items
                    .map((item) =>
                    Chip(
                      label: Text(item),
                      backgroundColor: Colors.red[100],
                      deleteIcon: Icon(Icons.close, size: 16),
                      onDeleted: () {},
                    ))
                    .toList(),
              ),
            ),
        ],
      );
    }).toList();
  }
}