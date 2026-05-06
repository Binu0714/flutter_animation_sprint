import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../widgets/bouncy_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _titleAnim, _buttonAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _titleAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.7, curve: Curves.easeOut)));
    _buttonAnim = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0, curve: Curves.easeOut)));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network('https://assets10.lottiefiles.com/packages/lf20_5tkzkblw.json', height: 200),
            FadeTransition(
              opacity: _titleAnim,
              child: const Text("Complete!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue)),
            ),
            const SizedBox(height: 50),

            FadeTransition(
              opacity: _buttonAnim,
              child: SizedBox(
                width: 300,
                child: BouncyCTAButton(
                    label: "Back to Hub",
                    onTap: () => context.go('/')
                ),
              ),
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