import 'package:pet_store/data/services/api_services.dart';
import 'package:pet_store/data/services/storage_services.dart';

import '../models/pet.dart';

class PetRepository {
  // Fetch All Adopted Pets
  Future<List<Pet>> fetchAdoptedPets() async {
    List<Pet> myPets = [];
    myPets = APIServices().getAdoptedPets();
    StorageServices().addApiToMemory(myPets);

    var adoptedpetsFromMemory = await StorageServices().getAllAdoptedPets();
    adoptedpetsFromMemory.pets?.forEach((element) {
      myPets.add(element);
    });
    return myPets;
  }

// Fetch All Available Pets
  Future<List<Pet>> fetchAvailablePets() async {
    List<Pet> myPets = APIServices().getAvailablePets();
    print(myPets);
    return myPets;
  }

// Save Adopted Pet
  Future<void> savePet(Pet pet) async {
    await StorageServices().saveAdoptedPet(pet);
  }

// Check if already adopted
  Future<bool> isPetSaved(int petId) async {
    Pet? savedPet = await StorageServices().getAdoptedPet(petId);
    if (savedPet?.id != null) {
      return true;
    }
    return false;
  }

// Save Liked Pet
  void likedAPet(Pet pet) {
    StorageServices().saveLikedPet(pet);
  }

  Future<bool> isALikedPet(int petId) async {
    Pet? isLiked = await StorageServices().getLikedPet(petId);
    if (isLiked?.id != null) {
      return true;
    }
    return false;
  }

  void unlikedPet(int petId) async {
    StorageServices().removeItem(petId);
  }
}
