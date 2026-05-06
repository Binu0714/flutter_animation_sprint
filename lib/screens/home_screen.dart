import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/animated_profile_card.dart';
import '../widgets/custom_spinner.dart';
import '../widgets/bouncy_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _tasks = ["Set up project", "Design UI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          children: [

            const Text(
              "Welcome to Animation Sprint,",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const Text(
              "Binu Jinajith",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 40), // Increased Gap

            const Center(child: LoadingSpinner()),

            const SizedBox(height: 50), // Increased Gap

            const ProfileCard(),

            const SizedBox(height: 50), // Increased Gap

            // Task Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                    "Project Tasks",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue, size: 28),
                  onPressed: () => setState(() => _tasks.add("Task ${_tasks.length + 1}")),
                ),
              ],
            ),
            const Divider(thickness: 1.2),

            // List of tasks
            ..._tasks.map((task) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: ScaleTransition(scale: anim, child: child)
              ),
              child: ListTile(
                  key: ValueKey(task),
                  title: Text(task, style: const TextStyle(fontSize: 16)),
                  leading: const Icon(Icons.check_circle_outline, color: Colors.blue)
              ),
            )),

            const SizedBox(height: 60), // Increased Gap

            Center(
              child: BouncyCTAButton(
                  label: "Open Product Gallery",
                  onTap: () => context.push('/gallery')
              ),
            ),

            const SizedBox(height: 40), // Bottom breathing room
          ],
        ),
      ),
    );
  }
}