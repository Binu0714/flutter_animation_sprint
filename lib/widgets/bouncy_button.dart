import 'package:flutter/material.dart';

class BouncyCTAButton extends StatefulWidget {
  final VoidCallback onTap;
  const BouncyCTAButton({super.key, required this.onTap});

  @override
  State<BouncyCTAButton> createState() => _BouncyCTAButtonState();
}

class _BouncyCTAButtonState extends State<BouncyCTAButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scale = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
          child: const Text("Continue to Onboarding", style: TextStyle(color: Colors.white)),
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