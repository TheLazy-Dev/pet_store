import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/gen/assets.gen.dart';
import 'package:pet_store/presentation/bloc/cubit/adopt_cubit.dart';
import 'package:pet_store/presentation/bloc/cubit/history_cubit.dart';
import 'package:pet_store/presentation/bloc/cubit/like_cubit.dart';
import 'package:pet_store/presentation/screens/widgets/adopted_dialog.dart';
import 'package:pet_store/presentation/screens/widgets/confetti.dart';
import 'package:pet_store/utils/dialog_handler.dart';

import '../../../../utils/fonts.dart';

class AdoptButtonBar extends StatelessWidget {
  final Pet pet;
  const AdoptButtonBar({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 15,
          ),
          BlocBuilder<PetLikedCubit, LikedState>(
              key: UniqueKey(),
              builder: (context, state) {
                return InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () => context.read<PetLikedCubit>().triggerLiked(pet),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(blurRadius: 18, color: Colors.black12)
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: (context.read<PetLikedCubit>().currentState ==
                            LikedState.IsLiked)
                        ? Lottie.asset(
                            Assets.lottie.likedHeart,
                            repeat: false,
                          )
                        : const Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.grey,
                          ),
                  ),
                );
              }),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, spreadRadius: -4, color: Colors.black12)
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: BlocBuilder<AdoptPetCubit, AdoptedPetStatus>(
                    builder: (context, state) {
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      if (context.read<AdoptPetCubit>().status ==
                              AdoptedPetStatus.IsAdopted ||
                          context.read<AdoptPetCubit>().status ==
                              AdoptedPetStatus.AlreadyAdopted) {
                        null;
                      } else {
                        context.read<AdoptPetCubit>().adoptPet(pet);
                        HistoryCubit hc = context.read<HistoryCubit>();
                        hc;
                        dialogHandler(
                            context,
                            Stack(
                              children: [
                                BlocProvider(
                                  create: (context) =>
                                      AdoptPetCubit(pet.id ?? 0),
                                  child: const ConfettiAnim(),
                                ),
                                AdoptedDialog(
                                  pet: pet,
                                ),
                              ],
                            ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            context.read<AdoptPetCubit>().status ==
                                        AdoptedPetStatus.IsAdopted ||
                                    context.read<AdoptPetCubit>().status ==
                                        AdoptedPetStatus.AlreadyAdopted
                                ? "Already Adopted"
                                : "Adopt",
                            style: TextStyleFonts.isProperties,
                          ),
                          context.read<AdoptPetCubit>().status ==
                                      AdoptedPetStatus.IsAdopted ||
                                  context.read<AdoptPetCubit>().status ==
                                      AdoptedPetStatus.AlreadyAdopted
                              ? const SizedBox.shrink()
                              : const RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(Icons.arrow_back_ios_new_rounded),
                                ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
