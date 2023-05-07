import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/data/models/pet.dart';

import '../../../data/repositories/pet_repository.dart';
import '../../states/history_states.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryLoadingState()) {
    fetchPets();
  }

  final PetRepository _petRepository = PetRepository();
  List<Pet> listPets = [];

  void fetchPets() async {
    try {
      listPets = await _petRepository.fetchAdoptedPets();
      emit(HistoryPetsLoaded(listPets));
    } catch (ex) {
      log(ex.toString());
      emit(HistoryErrorState(ex.toString()));
    }
  }

  void newPetAdded(pet) async {
    try {
      listPets.add(pet);
      emit(HistoryPetsLoaded(listPets));
    } catch (ex) {
      log(ex.toString());
      emit(HistoryErrorState(ex.toString()));
    }
  }
}
