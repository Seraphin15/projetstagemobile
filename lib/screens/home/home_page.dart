import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Text(
          "Bienvenue sur la page d’accueil!",
          style: TextStyle(fontSize: 22, color: Colors.green[800]),
        ),
      ),
    );
  }
}
