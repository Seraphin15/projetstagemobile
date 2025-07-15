import 'package:flutter/material.dart';

class PageProfil extends StatelessWidget {
  final Color vertFonce = const Color(0xFF227D38);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Profil"),
        backgroundColor: vertFonce,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Photo de profil
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/logo.png'), // Sary profil
            ),
            SizedBox(height: 15),

            // Nom sy Email
            Text(
              "Faneva Anjaratiana",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("faneva@example.com", style: TextStyle(color: Colors.grey)),

            SizedBox(height: 30),

            // Bouton Modifier
            ElevatedButton.icon(
              onPressed: () {
                // TODO: naviguer vers modifier profil
              },
              icon: Icon(Icons.edit),
              label: Text("Modifier profil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: vertFonce,
                minimumSize: Size(double.infinity, 45),
              ),
            ),
            SizedBox(height: 10),

            // Bouton Déconnexion
            OutlinedButton.icon(
              onPressed: () {
                // TODO: deconnecter sy miverina amin'ny login
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout),
              label: Text("Se déconnecter"),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 45),
                side: BorderSide(color: Colors.red),
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
