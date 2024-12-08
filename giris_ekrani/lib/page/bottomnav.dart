import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:giris_ekrani/page/profile.dart';
import 'package:flutter/material.dart';
import 'package:giris_ekrani/page/anasayfa.dart';
import 'package:giris_ekrani/page/favorite.dart';
import 'package:giris_ekrani/page/menu.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homepage;
  late FavoritesPage favoritesPage;
  late MenuPage menuPage;
  late Profile profile;

  @override
  void initState() {
    homepage = HomePage();
    favoritesPage = FavoritesPage();
    menuPage = MenuPage();
    profile=Profile();
    pages = [homepage, favoritesPage, menuPage, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.red,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            Icon(
              Icons.account_circle,
              color: Colors.white,
            )
          ]),
      body: pages[currentTabIndex],
    );
  }
}