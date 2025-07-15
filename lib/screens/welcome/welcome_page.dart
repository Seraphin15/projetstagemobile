import 'package:flutter/material.dart';
import 'dart:async';
import 'package:projetmobile/core/delayed_animation.dart';
import 'package:projetmobile/screens/auth/inscription_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => InscriptionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: DelayedAnimation(
          delay: 1000,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                  fontFamily: 'Arial',
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
