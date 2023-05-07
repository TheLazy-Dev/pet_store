import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/data/repositories/pet_repository.dart';
import 'package:pet_store/presentation/states/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState()) {
    fetchPets();
  }

  final PetRepository _petRepository = PetRepository();

  void fetchPets() async {
    var pets = await _petRepository.fetchAvailablePets();
    try {
      emit(HomePetsLoaded(pets));
    } catch (ex) {
      log(ex.toString());
      emit(HomeErrorState(ex.toString()));
    }
  }
}
