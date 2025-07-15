import 'package:flutter/material.dart';
import 'package:projetmobile/screens/auth/inscription_form.dart';
import 'package:projetmobile/screens/auth/login_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projetmobile/core/delayed_animation.dart';

class InscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            DelayedAnimation(
              delay: 1000,
              child: Column(
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Réseau Vert",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                      fontFamily: 'Arial',
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                ),
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30), // nampitomboina
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30), // fanampiana hampidina ilay votoaty
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.green[800],
                              minimumSize: Size(140, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                              );
                            },
                            child: Text("SE CONNECTER"),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(color: Colors.white),
                              minimumSize: Size(140, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => InscriptionForm()),
                              );
                            },
                            child: Text("S’INSCRIRE"),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Ou continue avec",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {
                          // TODO: Logique de connexion Google
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.white),
                          minimumSize: Size(double.infinity, 45),
                          padding: EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/logogoogle.png', height: 18),
                            SizedBox(width: 10),
                            Text('COMPTE GOOGLE'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
