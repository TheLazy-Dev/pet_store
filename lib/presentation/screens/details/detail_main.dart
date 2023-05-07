import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/presentation/bloc/cubit/adopt_cubit.dart';
import 'package:pet_store/presentation/bloc/cubit/like_cubit.dart';
import 'package:pet_store/presentation/screens/details/widgets/adopt_button_bar.dart';
import 'package:pet_store/presentation/screens/details/widgets/hero_image_widget.dart';

import '../../../../utils/fonts.dart';
import 'widgets/detail_widget_list.dart';

class PetDetailPage extends StatelessWidget {
  static const String id = "/details";
  final Pet? pet;
  final Color? color;
  const PetDetailPage({super.key, this.pet, this.color});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdoptPetCubit>(
        create: (context) => AdoptPetCubit(pet?.id ?? 0),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              right: 0,
                              child: HeroImageWidget(
                                pet: pet,
                                backgroundColor: color,
                              )),
                          Positioned(
                            top: 50,
                            left: 30,
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8, color: Colors.black12)
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DetailWidgetList(
                      pet: pet,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: BlocProvider(
                  create: (context) => PetLikedCubit(pet?.id ?? 0),
                  child: AdoptButtonBar(
                    pet: pet!,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PropertyBox extends StatelessWidget {
  final String? propertyName;
  final String? value;

  const PropertyBox({super.key, this.propertyName, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            propertyName.toString(),
            style: TextStyleFonts.mainProperty.copyWith(fontSize: 14),
          ),
          Text(
            value.toString(),
            style: TextStyleFonts.mainProperty.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

var sizedBox2sp = const SizedBox(
  width: 5,
);
