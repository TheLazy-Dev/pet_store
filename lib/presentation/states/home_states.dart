import 'package:pet_store/data/models/pet.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomePetsLoaded extends HomeState {
  final List<Pet> pets;
  HomePetsLoaded(this.pets);
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}
