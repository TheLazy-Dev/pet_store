import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/gen/assets.gen.dart';
import 'package:pet_store/presentation/screens/widgets/confetti.dart';

class AdoptedDialog extends StatelessWidget {
  const AdoptedDialog({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlertDialog(
          backgroundColor: Theme.of(context).canvasColor.withOpacity(1),
          insetPadding:
              const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
          title: Center(
            child: Text("You have successfully adopted",
                style: Theme.of(context)
                    .primaryTextTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16)),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${pet.name}",
                style:
                    Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                          fontSize: 20,
                        ),
              ),
              LottieBuilder.asset(
                Assets.lottie.cuteDog,
                height: 260,
              ),
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 18, color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Center(child: Text("So Cool"))),
              )
            ],
          ),
        ),
        const ConfettiAnim(
          wantConfetti: true,
        ),
      ],
    );
  }
}
