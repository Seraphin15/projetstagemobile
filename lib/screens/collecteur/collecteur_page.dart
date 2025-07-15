import 'package:flutter/material.dart';

class CollecteurPage extends StatefulWidget {
  @override
  State<CollecteurPage> createState() => _CollecteurPageState();
}

class _CollecteurPageState extends State<CollecteurPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Accueil')),
    Center(child: Text('Transporteur')),
    Center(child: Text('Point de vente')),
    Center(child: Text('Ajouter information')),
    Center(child: Text('Panier')),
    Center(child: Text('Notification')),
    Center(child: Text('Abonnement')),
    Center(child: Text('Langue')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Hanakatona ny Drawer rehefa misafidy
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collecteur'),
        backgroundColor: Colors.green[800],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green[800]),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.green),
              ),
              accountName: Text("Faneva Anjaratiana"),
              accountEmail: Text("Collecteur"),
            ),
            _buildDrawerItem(Icons.home, "Accueil", 0),
            _buildDrawerItem(Icons.favorite, "Transporteur", 1),
            _buildDrawerItem(Icons.location_on, "Point de vente", 2),
            _buildDrawerItem(Icons.add, "Ajouter information", 3),
            _buildDrawerItem(Icons.shopping_bag, "Panier", 4),
            _buildDrawerItem(Icons.notifications, "Notification", 5),
            _buildDrawerItem(Icons.favorite_border, "Abonnement", 6),
            Divider(),
            _buildDrawerItem(Icons.language, "Langue", 7),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: _selectedIndex == index,
      onTap: () => _onItemTapped(index),
    );
  }
}
