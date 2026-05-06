import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bouncy_button.dart';

class DetailScreen extends StatelessWidget {
  final String id; // The product ID passed from the router

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        // The back button automatically handles reversing the Hero animation
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TASK 3A: Hero Animation (Target)
          // Tag MUST match the tag used in home_screen exactly
          Hero(
            tag: 'product_$id',
            child: Container(
              width: double.infinity, // Requirement: Show hero at full width
              height: 300,
              color: Colors.blueGrey,
              child: const Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id.toUpperCase().replaceAll('_', ' '),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "This product detail page was reached using a shared element Hero transition "
                      "and a custom PageRouteBuilder slide-up transition.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Task 2B: Integrating the Bouncy Button to navigate to Phase 4
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: BouncyCTAButton(
                onTap: () => context.push('/success'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}