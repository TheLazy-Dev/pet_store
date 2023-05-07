import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_store/gen/assets.gen.dart';

class ConfettiAnim extends StatelessWidget {
  const ConfettiAnim({super.key, this.wantConfetti = false});
  final bool wantConfetti;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: wantConfetti,
      child: LottieBuilder.asset(
        Assets.lottie.confetti,
        repeat: false,
      ),
    );
  }
}
