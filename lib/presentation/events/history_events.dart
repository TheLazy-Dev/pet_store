abstract class HistoryEvent {
  const HistoryEvent();
}

class FetchHistoryPets extends HistoryEvent {
  const FetchHistoryPets() : super();
}

class HistoryPetsLoadedEvent extends HistoryEvent {
  const HistoryPetsLoadedEvent();
}

class HistoryErrorStateEvent extends HistoryEvent {
  final String error;
  const HistoryErrorStateEvent(this.error);
}
