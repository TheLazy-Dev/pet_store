abstract class SearchEvent {}

class SearchStarted extends SearchEvent {}

class SearchCanceled extends SearchEvent {}

abstract class SearchState {}

class SearchIdle extends SearchState {}

class SearchInProgress extends SearchState {}

class SearchCanceledState extends SearchState {}
