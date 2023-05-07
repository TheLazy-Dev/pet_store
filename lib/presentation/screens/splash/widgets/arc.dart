import 'package:flutter/material.dart';
import 'dart:math';

class ArcButton extends StatefulWidget {
  final double diameter;
  final double arcLength;

  ArcButton({required this.diameter, required this.arcLength});

  @override
  _ArcButtonState createState() => _ArcButtonState();
}

class _ArcButtonState extends State<ArcButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.repeat();
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _startAnimation(),
      onTapUp: (_) => _stopAnimation(),
      onTapCancel: () => _stopAnimation(),
      child: SizedBox(
        width: widget.diameter,
        height: widget.diameter,
        child: Stack(
          children: [
            CustomPaint(
              painter: ArcPainter(arcLength: widget.arcLength),
            ),
            Center(
              child: Text(
                'Tap Me!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double arcLength;

  ArcPainter({required this.arcLength});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final arcPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcLength,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
