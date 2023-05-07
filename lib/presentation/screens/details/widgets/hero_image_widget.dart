import 'package:flutter/material.dart';
import 'package:pet_store/data/models/pet.dart';

class HeroImageWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Pet? pet;
  const HeroImageWidget({
    super.key,
    this.backgroundColor,
    this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width - 50,
          color: backgroundColor,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          height: 300,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(50))),
          child: Hero(
            tag: pet?.id ?? '',
            child: InteractiveViewer(
              panEnabled: false, // Set it to false
              boundaryMargin: const EdgeInsets.all(100),
              minScale: 0.5,
              maxScale: 2,
              child: Image.network(
                pet?.imageUrl ?? "",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
