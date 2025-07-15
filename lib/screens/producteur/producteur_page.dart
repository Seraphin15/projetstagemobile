import 'package:flutter/material.dart';
import 'publier_produit_page.dart';
import 'accueil_produit_page.dart';

class ProducteurPage extends StatefulWidget {
  @override
  State<ProducteurPage> createState() => _ProducteurPageState();
}

class _ProducteurPageState extends State<ProducteurPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AccueilPage(),
    PublierProduitPage(),
    Center(child: Text('🔔 Notifications')),
    Center(child: Text('💬 Messages')),
    Center(child: Text('👤 Mon profil')),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Publier"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notif"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
