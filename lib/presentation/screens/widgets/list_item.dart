import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/presentation/screens/details/detail_main.dart';

class PetHistoryItem extends StatelessWidget {
  final Pet pet;
  const PetHistoryItem({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.parse(
      "${pet.adoptedDate}",
    );
    var formate1 = DateFormat("MMM dd, yyyy");
    final random = Random();
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () => Navigator.pushNamed(context, PetDetailPage.id, arguments: {
        'pet': pet,
        'color': Color.fromRGBO(
            random.nextInt(256), random.nextInt(256), random.nextInt(256), 1),
      }),
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 6),
        leading: SizedBox(
          height: 50,
          width: 50,
          child: Hero(
              tag: pet.id ?? '',
              child: Image.network(
                pet.imageUrl.toString(),
                fit: BoxFit.cover,
              )),
        ),
        title: Text(
          pet.name.toString(),
          style: Theme.of(context).primaryTextTheme.displayMedium,
        ),
        subtitle: Text(formate1.format(dateTime),
            style: Theme.of(context).primaryTextTheme.displayMedium),
        isThreeLine: true,
      ),
    );
  }
}
