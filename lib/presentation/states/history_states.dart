import 'package:pet_store/data/models/pet.dart';

abstract class HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistoryPetsLoaded extends HistoryState {
  final List<Pet> pets;
  HistoryPetsLoaded(this.pets);
}

class HistoryErrorState extends HistoryState {
  final String error;
  HistoryErrorState(this.error);
}
