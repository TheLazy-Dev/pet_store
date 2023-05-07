import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_store/presentation/screens/widgets/confetti.dart';

void main() {
  group('ConfettiAnim', () {
    testWidgets('should show confetti animation when wantConfetti is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfettiAnim(wantConfetti: true),
        ),
      );

      final confettiWidget = find.byType(Lottie);
      expect(confettiWidget, findsOneWidget);
    });

    testWidgets('should hide confetti animation when wantConfetti is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ConfettiAnim(wantConfetti: false),
        ),
      );

      final confettiWidget = find.byType(Lottie);
      expect(confettiWidget, findsNothing);
    });
  });
}
