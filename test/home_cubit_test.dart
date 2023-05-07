import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_store/data/models/pet.dart';
import 'package:pet_store/data/repositories/pet_repository.dart';
import 'package:pet_store/presentation/bloc/cubit/like_cubit.dart';

class MockPetRepository extends Mock implements PetRepository {}

void main() {
  group('PetLikedCubit', () {
    late PetLikedCubit petLikedCubit;
    final petRepository = MockPetRepository();

    petLikedCubit = PetLikedCubit(9);

    test('initial state should be LikedState.Initial', () {
      expect(petLikedCubit.state, equals(LikedState.Initial));
    });

    test('should emit LikedState.IsLiked if a pet is liked', () async {
      when(petRepository.isALikedPet(9)).thenAnswer((_) async => true);
      petLikedCubit.isLikedPetSaved(9);
      await expectLater(petLikedCubit.stream, emits(LikedState.IsLiked));
    });

    test('should emit LikedState.IsNotLiked if a pet is not liked', () async {
      when(petRepository.isALikedPet(9)).thenAnswer((_) async => false);
      petLikedCubit.isLikedPetSaved(9);
      await expectLater(petLikedCubit.stream, emits(LikedState.IsNotLiked));
    });

    test(
        'should change state to LikedState.IsLiked if triggerLiked is called on an unliked pet',
        () async {
      final pet = Pet(
          id: 9,
          name: 'Fluffy',
          age: 2,
          breed: 'Mixed',
          gender: "male",
          details: 'Friendly and playful',
          imageUrl: 'https://my.petstore.com/images/fluffy.jpg',
          price: 200);
      when(petRepository.isALikedPet(9)).thenAnswer((_) async => false);
      when(petRepository.likedAPet(pet)).thenAnswer((_) async => null);
      petLikedCubit.triggerLiked(pet);
      await expectLater(petLikedCubit.stream, emits(LikedState.IsLiked));
    });

    test(
        'should change state to LikedState.IsNotLiked if triggerLiked is called on a liked pet',
        () async {
      final pet = Pet(
          id: 9,
          name: 'Fluffy',
          age: 2,
          breed: 'Mixed',
          gender: "male",
          details: 'Friendly and playful',
          imageUrl: 'https://my.petstore.com/images/fluffy.jpg',
          price: 200);
      when(petRepository.isALikedPet(9)).thenAnswer((_) async => true);
      when(petRepository.unlikedPet(9)).thenAnswer((_) async => null);
      petLikedCubit.triggerLiked(pet);
      await expectLater(petLikedCubit.stream, emits(LikedState.IsNotLiked));
    });
  });
}
