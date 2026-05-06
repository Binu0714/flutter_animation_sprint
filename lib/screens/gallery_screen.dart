import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {"name": "Watch", "icon": Icons.watch},
    {"name": "Phone", "icon": Icons.smartphone},
    {"name": "Laptop", "icon": Icons.laptop},
    {"name": "Camera", "icon": Icons.camera_alt},
    {"name": "Headphones", "icon": Icons.headphones},
    {"name": "Gameboy", "icon": Icons.videogame_asset},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Gallery")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: products.length,
        itemBuilder: (context, i) {
          final product = products[i];
          final id = product['name'];
          return GestureDetector(
            onTap: () => context.push('/detail/$id'),
            child: Hero(
              tag: 'product_$id',
              child: Card(
                elevation: 4,
                color: Colors.blue.shade400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(product['icon'], size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(id, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}