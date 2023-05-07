import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/data/repositories/pet_repository.dart';

enum LikedState { Initial, IsLiked, IsNotLiked }

class PetLikedCubit extends Cubit<LikedState> {
  PetLikedCubit(petId) : super(LikedState.Initial) {
    isLikedPetSaved(petId);
  }

  var currentState = LikedState.IsNotLiked;
  final PetRepository _petRepository = PetRepository();

  void isLikedPetSaved(int petId) async {
    bool isSaved = await _petRepository.isALikedPet(petId);
    if (isSaved) {
      emit(currentState = LikedState.IsLiked);
    }
  }

  triggerLiked(Pet pet) {
    if (currentState == LikedState.IsLiked) {
      _petRepository.unlikedPet(pet.id ?? 0);
      emit(currentState = LikedState.IsNotLiked);
    } else {
      _petRepository.likedAPet(Pet(
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
      emit(currentState = LikedState.IsLiked);
    }
  }
}
