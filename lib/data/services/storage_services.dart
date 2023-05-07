import 'package:pet_store/data/models/pet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageServices {
  // Adopted Pets [Save 1 & Save to List]
  Future<void> saveAdoptedPet(Pet pet) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('adoptedPet${pet.id}', jsonEncode(pet.toJson()));
    addPetToList(pet);
  }

  // Add API Responses to oneTimeList
  void addApiToMemory(List pets) async {
    final prefs = await SharedPreferences.getInstance();
    // for (var pet in pets) {
    //   await prefs.setString('adoptedPet${pet.id}', jsonEncode(pet.toJson()));
    // }
  }

// Adopted Pets [Get 1 Adopted]
  Future<Pet?> getAdoptedPet(int petId) async {
    final prefs = await SharedPreferences.getInstance();
    final adoptedPetJson = prefs.getString('adoptedPet$petId');
    if (adoptedPetJson == null) {
      return null;
    } else {
      final adoptedPetMap = jsonDecode(adoptedPetJson);
      return Pet.fromJson(adoptedPetMap);
    }
  }

// Adopted Pets [Add Adopted as List]
  void addPetToList(Pet pet) async {
    final prefs = await SharedPreferences.getInstance();
    final myList = jsonDecode(prefs.getString('pets') ?? '[]');
    myList.add(pet);
    await prefs.setString('pets', jsonEncode(myList));
  }

// Adopted Pets [Get All Adopted As List]
  Future<Pets> getAllAdoptedPets() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic myList;
    if (prefs.getString('pets') != null) {
      myList = jsonDecode('{"pets":${prefs.getString('pets')}}');
      return Pets.fromJson(myList);
    }
    return Pets(pets: []);
  }

// Saved Pet [Saved 1 ]
  Future<void> saveLikedPet(Pet pet) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('likedPet${pet.id}', jsonEncode(pet.toJson()));
    addPetToLikedList(pet); //Save to list
  }

// Saved Pet [Save to list]
  void addPetToLikedList(Pet pet) async {
    final prefs = await SharedPreferences.getInstance();
    final myList = jsonDecode(prefs.getString('liked') ?? '[]');
    await prefs.setString('liked', jsonEncode(myList));
  }

// Saved Pet [Get 1]
  Future<Pet?> getLikedPet(int petId) async {
    final prefs = await SharedPreferences.getInstance();
    final likedPetJson = prefs.getString('likedPet$petId');
    if (likedPetJson == null) {
      return null;
    } else {
      final adoptedPetMap = jsonDecode(likedPetJson);
      return Pet.fromJson(adoptedPetMap);
    }
  }

// Fetch All Liked
  Future<Pets> getAllLikedPets() async {
    final prefs = await SharedPreferences.getInstance();
    late dynamic myList;
    if (prefs.getString('liked') != null) {
      myList = jsonDecode('{"pets":${prefs.getString('liked')}}');
    }
    return Pets.fromJson(myList);
  }

// Remove from Liked
  void removeItem(int petId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('likedPet$petId');
    late dynamic myList;
    if (prefs.getString('liked')?.isNotEmpty ?? [].isNotEmpty) {
      myList = jsonDecode(prefs.getString('liked') ?? '[]');
      print(myList);
      Pets petList = Pets.fromJson(myList);
      petList.pets?.removeWhere((element) => element.id == petId);
    }
    await prefs.setString('liked', jsonEncode(myList));
  }
}
