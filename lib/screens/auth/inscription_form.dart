import 'package:flutter/material.dart';
import 'package:projetmobile/screens/auth/login_form.dart';

class InscriptionForm extends StatefulWidget {
  @override
  State<InscriptionForm> createState() => _InscriptionFormState();
}

class _InscriptionFormState extends State<InscriptionForm> {
  final _formKey = GlobalKey<FormState>();

  final _nomCompletController = TextEditingController();
  final _emailController = TextEditingController();
  final _adresseController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedZone;
  String? _selectedUserType;

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  final List<String> _zones = ['Tananarive', 'Fianarantsoa', 'Toamasina'];
  final List<String> _userTypes = ['Acheteur', 'Producteur', 'Collecteur'];

  @override
  void dispose() {
    _nomCompletController.dispose();
    _emailController.dispose();
    _adresseController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _registerLocal() {
    setState(() => _isLoading = true);

    Future.delayed(Duration(milliseconds: 900), () {
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Inscription réussie')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginForm()),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Créer un compte",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: greenColor,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Nom complet
              TextFormField(
                controller: _nomCompletController,
                decoration: InputDecoration(labelText: "Votre nom complet"),
                validator: (value) =>
                value == null || value.isEmpty ? "Champ requis" : null,
              ),
              SizedBox(height: 10),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Champ requis";
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Email invalide";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Adresse
              TextFormField(
                controller: _adresseController,
                decoration: InputDecoration(labelText: "Adresse"),
                validator: (value) =>
                value == null || value.isEmpty ? "Champ requis" : null,
              ),
              SizedBox(height: 10),

              // Zone
              DropdownButtonFormField<String>(
                value: _selectedZone,
                items: _zones.map((zone) {
                  return DropdownMenuItem(
                    value: zone,
                    child: Text(zone),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedZone = value),
                decoration: InputDecoration(labelText: "Zone"),
                validator: (value) =>
                value == null ? "Veuillez choisir une zone" : null,
              ),
              SizedBox(height: 10),

              // Type utilisateur
              DropdownButtonFormField<String>(
                value: _selectedUserType,
                items: _userTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedUserType = value),
                decoration: InputDecoration(labelText: "Type d'utilisateur"),
                validator: (value) =>
                value == null ? "Veuillez choisir un type" : null,
              ),
              SizedBox(height: 10),

              // Mot de passe
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (value) => value == null || value.length < 6
                    ? "Minimum 6 caractères"
                    : null,
              ),
              SizedBox(height: 10),

              // Confirmer mot de passe
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirm,
                decoration: InputDecoration(
                  labelText: "Confirmer le mot de passe",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirm
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
                validator: (value) => value != _passwordController.text
                    ? "Les mots de passe ne correspondent pas"
                    : null,
              ),
              SizedBox(height: 30),

              // Bouton S'inscrire
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                  if (_formKey.currentState!.validate()) {
                    _registerLocal();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("S'inscrire", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 60),

              // Bouton vers login
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginForm()),
                  );
                },
                child: Text("Vous avez déjà un compte ? Se connecter",
                    style: TextStyle(color: greenColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
