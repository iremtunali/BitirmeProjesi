import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  // Örnek favoriler listesi
  final List<Map<String, String>> favoriteRecipes = [
    {'title': 'Domates Çorbası', 'image': 'https://images.pexels.com/photos/262947/pexels-photo-262947.jpeg?auto=compress&cs=tinysrgb&w=600'},
    {'title': 'Mantı', 'image': 'https://images.pexels.com/photos/19579039/pexels-photo-19579039/free-photo-of-manti.jpeg?auto=compress&cs=tinysrgb&w=400'},
    {'title': 'Karnıyarık', 'image': 'https://images.pexels.com/photos/18126188/pexels-photo-18126188/free-photo-of-plaka-tabak-aksam-yemegi-patlican.png?auto=compress&cs=tinysrgb&w=400'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoriler'),
        backgroundColor: Colors.red,
      ),

      body: favoriteRecipes.isEmpty
          ? Center(
        child: Text(
          'Henüz favori tarif eklemediniz.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(
                recipe['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(recipe['title']!),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Favorilerden çıkarma işlemi burada yapılabilir
                  print('${recipe['title']} favorilerden çıkarıldı.');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
