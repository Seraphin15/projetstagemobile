import 'package:flutter/material.dart';

class AccueilPage extends StatelessWidget {
  final Color vertFonce = const Color(0xFF227D38);
  final Color jaune = const Color(0xFFD4CC2B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- Search direct en haut ----
            TextField(
              decoration: InputDecoration(
                hintText: "Recherche de produit...",
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ---- Filtres ----
            Row(
              children: [
                _tag("Tout", selected: true),
                _tag("Fruits"),
                _tag("Légumes"),
                _tag("Produits Bio"),
              ],
            ),
            const SizedBox(height: 20),

            // ---- Promo Section ----
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: jaune,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Offre spéciale 🔥",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "Jusqu'à -40%",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: Text("Découvrir",
                              style: TextStyle(color: jaune)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    "images/logo.png",
                    height: 80,
                    width: 80,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ---- Produits Populaires ----
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Produits populaires",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Voir tout", style: TextStyle(color: vertFonce)),
              ],
            ),
            const SizedBox(height: 10),

            // ---- Grid Produit ----
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.75,
              children: List.generate(4, (index) => _productCard()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(String label, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? vertFonce : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _productCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Image.asset('images/logo.png', height: 100, fit: BoxFit.contain),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tomates bio",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text("Légumes frais",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("1,200 Ar",
                        style: TextStyle(color: Color(0xFF227D38))),
                    Icon(Icons.favorite_border, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
