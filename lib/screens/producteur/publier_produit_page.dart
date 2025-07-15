import 'package:flutter/material.dart';

class PublierProduitPage extends StatefulWidget {
  @override
  _PublierProduitPageState createState() => _PublierProduitPageState();
}

class _PublierProduitPageState extends State<PublierProduitPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final _formKey = GlobalKey<FormState>();
  final _nomProduitController = TextEditingController();
  final _quantiteController = TextEditingController();
  final _prixController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _zoneSelected;
  DateTime? _validUntil;
  bool _isBio = false;
  bool _isLocal = false;

  List<String> _zones = ['Tananarive', 'Fianarantsoa', 'Toamasina'];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _nomProduitController.dispose();
    _quantiteController.dispose();
    _prixController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _validUntil = picked;
      });
    }
  }

  void _publier() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("✅ Offre publiée !"),
        backgroundColor: Colors.green[700],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final greenColor = Colors.green[800];
    return Scaffold(

      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Produit à vendre
                TextFormField(
                  controller: _nomProduitController,
                  decoration: InputDecoration(
                    labelText: "Produit à vendre",
                    hintText: "Ex: Tomates bio, Pommes...",
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                  v == null || v.isEmpty ? "Champ requis" : null,
                ),
                SizedBox(height: 16),

                // Quantité & Prix
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _quantiteController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Quantité",
                          hintText: "Ex: 100",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _prixController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Prix unitaire (€)",
                          hintText: "Ex: 3.50",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Zone & Date
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _zoneSelected,
                        items: _zones
                            .map((z) => DropdownMenuItem(
                          value: z,
                          child: Text(z),
                        ))
                            .toList(),
                        onChanged: (value) => setState(() {
                          _zoneSelected = value;
                        }),
                        decoration: InputDecoration(
                          labelText: "Zone de collecte",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: _selectDate,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Valide jusqu'au",
                            border: OutlineInputBorder(),
                          ),
                          child: Text(
                            _validUntil == null
                                ? "Sélectionner"
                                : "${_validUntil!.toLocal()}".split(' ')[0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Certification
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Switch(
                          value: _isBio,
                          onChanged: (v) => setState(() => _isBio = v),
                        ),
                        Text("Produit bio certifié"),
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: _isLocal,
                          onChanged: (v) => setState(() => _isLocal = v),
                        ),
                        Text("Production locale"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Photo (mock only)
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload, size: 36, color: Colors.grey),
                        Text("Choisir une photo du produit"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Description détaillée",
                    hintText: "Ex: variété, fraîcheur, méthode de culture...",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24),

                // Bouton Publier
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _publier,
                    icon: Icon(Icons.send),
                    label: Text("Publier mon offre"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greenColor,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
