import 'dart:math';
import 'package:flutter/material.dart';

class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({super.key});
  @override
  State<LoadingSpinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<LoadingSpinner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: CustomPaint(painter: ArcPainter(), size: const Size(50, 50)),
            ),
            // Pulsing Dot
            Container(
              width: 10 + (5 * sin(_controller.value * 2 * pi)),
              height: 10 + (5 * sin(_controller.value * 2 * pi)),
              decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
          ],
        );
      },
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue..strokeWidth = 4..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), 0, 1.5, false, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}