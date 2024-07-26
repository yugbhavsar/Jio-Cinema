import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_filter_event.dart';
part 'event_filter_state.dart';

class EventFilterBloc extends Bloc<EventFilterEvent, EventFilterState> {


  EventFilterBloc() : super(EventFilterState()) {

    on<EventFilterEvent>((event, emit) {

    });

    on<EventFilterChangeCategories>((event, emit) {
        state.selectedCategories = event.currentSelection;
        emit(state.copy());
    });

    on<EventFilterDateTimeChange>((event, emit) {
      state.selectedDateTimeIndex = event.currentSelection;
      emit(state.copy());
    });

    on<EventFilterPriceRangeChangeEvent>((event, emit) {
      state.minPriceValue = event.minValue;
      state.maxPriceValue = event.maxValue;
      emit(state.copy());
    },);
  }
}
