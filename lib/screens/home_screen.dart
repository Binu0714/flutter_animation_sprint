import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/animated_profile_card.dart';
import '../widgets/custom_spinner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _items = ["Task 1", "Task 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animation Sprint")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoadingSpinner(), // Task 2A
            const ProfileCard(), // Task 1A

            // Task 1B: AnimatedSwitcher in a List context
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() => _items.add("New Task ${_items.length}")),
            ),
            ..._items.map((item) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: FadeTransition(opacity: anim, child: child)),
              child: ListTile(key: ValueKey(item), title: Text(item)),
            )),

            const Text("Product Gallery (Hero Task 3A)"),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 6,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => context.push('/detail/product_$i'),
                child: Hero(
                  tag: 'product_product_$i', // Requirement: ID-based tag
                  child: Card(color: Colors.blueGrey, child: Center(child: Text("Product $i"))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}