import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/data/repositories/pet_repository.dart';

import '../../../data/models/pet.dart';

enum AdoptedPetStatus { Initial, IsAdopted, IsNotAdopted, AlreadyAdopted }

class AdoptPetCubit extends Cubit<AdoptedPetStatus> {
  final PetRepository _petRepository = PetRepository();
  AdoptedPetStatus status = AdoptedPetStatus.IsNotAdopted;
  AdoptPetCubit(int petId) : super(AdoptedPetStatus.Initial) {
    isPetSaved(petId);
  }

  void adoptPet(Pet pet) {
    savePet(pet);
    emit(status = AdoptedPetStatus.IsAdopted);
  }

  void savePet(Pet pet) {
    _petRepository.savePet(Pet(
      id: pet.id,
      name: pet.name,
      age: pet.age,
      breed: pet.breed,
      details: pet.details,
      adoptedDate: DateTime.now(),
      gender: pet.gender,
      imageUrl: pet.imageUrl,
      price: pet.price,
    ));
  }

  void isPetSaved(int petId) async {
    bool isSaved = await _petRepository.isPetSaved(petId);
    if (isSaved) {
      emit(status = AdoptedPetStatus.AlreadyAdopted);
    }
  }
}
