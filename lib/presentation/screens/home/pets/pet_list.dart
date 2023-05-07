import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/presentation/bloc/cubit/home_cubit.dart';
import 'package:pet_store/presentation/screens/home/pets/pet_card.dart';
import 'package:pet_store/presentation/states/home_states.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomePetsLoaded) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: GridView.builder(
            itemCount: state.pets.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var npet = state.pets[index];
              return PetCard(needtopSpace: false, npet);
            },
          ),
        );
      } else {
        return const Center();
      }
    });
  }
}
