import 'dart:math';
import 'package:flutter/material.dart';

class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({super.key});
  @override
  State<LoadingSpinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<LoadingSpinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // Requirement
    )..repeat();

    _rotation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.purple).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Requirement: NEVER FORGET
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: SpinnerPainter(_rotation.value, _colorAnimation.value!),
          size: const Size(50, 50),
        );
      },
    );
  }
}

class SpinnerPainter extends CustomPainter {
  final double rotation;
  final Color color;
  SpinnerPainter(this.rotation, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 4..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), rotation, 2, false, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}