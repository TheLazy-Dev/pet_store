import 'package:flutter/material.dart';
import 'package:pet_store/data/models/pet.dart';

import '../../../../utils/fonts.dart';

class DetailWidgetList extends StatelessWidget {
  final Pet? pet;
  const DetailWidgetList({super.key, this.pet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(pet!.name ?? '',
              style: Theme.of(context)
                  .primaryTextTheme
                  .displayLarge
                  ?.copyWith(fontSize: 30)),
          Text(
            '\$ ${pet!.price}',
            style: TextStyleFonts.mainPropertyDark
                .copyWith(fontSize: 20, color: Colors.green),
          ),
          Text(
            'Age: ${pet!.age} Years',
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(fontSize: 20),
          ),
          Text(
            'Gender: ${pet!.gender}',
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(fontSize: 20),
          ),
          Text(
            'Breed: ${pet!.breed}',
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(fontSize: 20),
          ),
          Text(
            'Vaccinated: ${true}',
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            pet!.details.toString(),
            style: Theme.of(context)
                .primaryTextTheme
                .displayMedium
                ?.copyWith(fontSize: 20),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
