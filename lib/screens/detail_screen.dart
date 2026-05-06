import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: Column(
        children: [
          Container(height: 300, color: Colors.blue, width: double.infinity),
          const Spacer(),
          ElevatedButton(
            onPressed: () => context.push('/success'),
            child: const Text("Complete Task"),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}