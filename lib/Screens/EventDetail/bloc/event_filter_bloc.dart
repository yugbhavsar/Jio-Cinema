import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_filter_event.dart';
part 'event_filter_state.dart';

class EventFilterBloc extends Bloc<EventFilterEvent, EventFilterState> {


  EventFilterBloc() : super(EventFilterInitial()) {
    on<EventFilterEvent>((event, emit) {

    });

    on<EventFilterChangeCategories>((event, emit) {
        emit(EventFilterCategoriesChangeState(event.currentSelection));
    });

    on<EventFilterDateTimeChange>((event, emit) {
        emit(EventFilterChangeDateTimeSelection(selectedIndex: event.currentSelection));
    });
  }
}
