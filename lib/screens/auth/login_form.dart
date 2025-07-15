import 'package:flutter/material.dart';
import 'package:projetmobile/screens/acheteur/acheteur_page.dart';
import 'package:projetmobile/screens/collecteur/collecteur_page.dart';
import 'package:projetmobile/screens/producteur/producteur_page.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedUserType;
  final List<String> _userTypes = ['Collecteur', 'Acheteur', 'Producteur'];

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginLocal() {
    setState(() => _isLoading = true);

    Future.delayed(Duration(milliseconds: 800), () {
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connexion réussie (mode local)')),
      );

      Widget destination;
      if (_selectedUserType == 'Collecteur') {
        destination = CollecteurPage();
      } else if (_selectedUserType == 'Acheteur') {
        destination = AcheteurPage();
      } else {
        destination = ProducteurPage();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => destination),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final greenColor = Colors.green[800];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: greenColor),
          onPressed: () => Navigator.pop(context),
          tooltip: "Retour",
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Se connecter",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: greenColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ce champ est requis";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Email invalide";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Mot de passe
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer votre mot de passe";
                      } else if (value.length < 6) {
                        return "Mot de passe trop court (min. 6 caractères)";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // Type utilisateur
                  DropdownButtonFormField<String>(
                    value: _selectedUserType,
                    items: _userTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedUserType = value);
                    },
                    decoration: InputDecoration(
                      labelText: "Type d'utilisateur",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) =>
                    value == null ? "Veuillez choisir un type" : null,
                  ),
                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : () {
                      if (_formKey.currentState!.validate()) {
                        _loginLocal();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: greenColor!.withOpacity(0.4),
                      elevation: 8,
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      "Connexion",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
