import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/pet_repository.dart';
import '../../data/models/pet.dart';
import '../events/history_events.dart';
import '../states/history_states.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final PetRepository _petRepository;
  final List<Pet> pets = [];

  HistoryBloc({required PetRepository petRepository})
      : _petRepository = petRepository,
        super(HistoryLoadingState());
}
