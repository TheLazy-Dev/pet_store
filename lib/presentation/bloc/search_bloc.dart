import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_store/presentation/events/search_events.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchIdle());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchStarted) {
      yield SearchInProgress();
    } else if (event is SearchCanceled) {
      yield SearchCanceledState();
    }
  }
}
