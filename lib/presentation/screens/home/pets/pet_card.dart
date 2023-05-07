import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/presentation/screens/details/detail_main.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final bool? needtopSpace;

  const PetCard(this.pet, {super.key, this.needtopSpace});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final color = Color.fromRGBO(
        random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () => Navigator.pushNamed(context, PetDetailPage.id, arguments: {
        'pet': pet,
        'color': color,
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (needtopSpace ?? false)
            const SizedBox(
              height: 20,
            ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: pet.id ?? '',
                  child: Image.network(
                    fit: BoxFit.cover,
                    pet.imageUrl ?? '',
                    width: 200,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: (needtopSpace ?? false) ? 10 : 8),
          Text(
            pet.name ?? '',
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(fontSize: 18),
          ),
          SizedBox(height: (needtopSpace ?? false) ? 6 : 4),
          Text(pet.breed ?? '',
              style: Theme.of(context).primaryTextTheme.displayMedium),
          SizedBox(height: (needtopSpace ?? false) ? 6 : 4),
          Text(
            '${pet.age} years old',
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
