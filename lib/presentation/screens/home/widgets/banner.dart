import 'package:flutter/material.dart';
import 'package:pet_store/gen/assets.gen.dart';
import 'package:pet_store/utils/fonts.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Center(
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: Colors.orange.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 40,
          child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: -4,
                  blurRadius: 10,
                  color: Color.fromARGB(50, 0, 0, 0),
                  blurStyle: BlurStyle.normal,
                  offset: Offset(0, 2),
                ),
              ],
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                "-25%",
                style: TextStyleFonts.mainPropertyDark.copyWith(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
            ),
            child: SizedBox(
              child: Image.asset(
                Assets.images.petWithFamily.path,
                fit: BoxFit.cover,
                height: 190,
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          bottom: 40,
          child: RichText(
            text: TextSpan(
              children: [
                stackSpantext("Bring Home\n"),
                stackSpantext("A New Pet."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TextSpan stackSpantext(String text) {
  return TextSpan(
    text: text,
    style: TextStyleFonts.mainProperty.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 32,
    ),
  );
}
