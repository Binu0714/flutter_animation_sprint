import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bouncy_button.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Column(
        children: [
          // Task 3A: Hero Animation Target
          Hero(
            tag: 'product_$id',
            child: Container(
              width: double.infinity,
              height: 300,
              color: Colors.blue,
              child: const Icon(Icons.shopping_cart, size: 100, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          // Product ID Title
          Text(
              id.toUpperCase(),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
          ),

          // Added: Lorem Dummy Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                  "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                  "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
                  "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
                  "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5 // Added line height for better readability
              ),
            ),
          ),

          const Spacer(),

          // Navigation to Phase 4 (Success Screen)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BouncyCTAButton(
                label: "Finish Checkout",
                onTap: () => context.push('/success')
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}