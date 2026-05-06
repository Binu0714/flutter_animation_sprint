import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/bouncy_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnim;
  late Animation<double> _titleAnim;
  late Animation<double> _buttonAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    // Task 4A: Stagger Setup exactly from Doc
    _imageAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4, curve: Curves.easeOut)));
    _titleAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.6, curve: Curves.easeOut)));
    _buttonAnim = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.7, 1.0, curve: Curves.easeOut)));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Task 4B: Lottie Integration
            FadeTransition(
              opacity: _imageAnim,
              child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_5tkzkblw.json', // Success Checkmark
                onLoaded: (comp) => _controller.duration = comp.duration,
              ),
            ),
            FadeTransition(
              opacity: _titleAnim,
              child: const Text("Sprint Complete!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 50),
            FadeTransition(
              opacity: _buttonAnim,
              child: BouncyCTAButton(onTap: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}