import 'package:flutter/material.dart';
import '../widgets/animated_profile_card.dart';
import '../widgets/custom_spinner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: const Column(
        children: [
          CustomSpinner(), // Placeholder
          AnimatedProfileCard(), // Placeholder
        ],
      ),
    );
  }
}