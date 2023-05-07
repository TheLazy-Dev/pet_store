import 'package:flutter/material.dart';
import 'package:pet_store/presentation/screens/splash/widgets/arc.dart';

class RotatingCircularWidget extends StatefulWidget {
  const RotatingCircularWidget({super.key});

  @override
  State<RotatingCircularWidget> createState() => _RotatingCircularWidgetState();
}

class _RotatingCircularWidgetState extends State<RotatingCircularWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _controller.repeat();
        });
      },
      onTapUp: (_) {
        setState(() {
          _controller.stop();
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.blue, width: 5, style: BorderStyle.solid),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.blue,
              Colors.blue,
            ],
            stops: [0.0, 0.5, 0.7],
          ),
        ),
        child: GestureDetector(
          onTap: () {
            _controller.repeat();
          },
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Center(
              child: Stack(
                children: [ArcButton(diameter: 5.6, arcLength: 7)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
