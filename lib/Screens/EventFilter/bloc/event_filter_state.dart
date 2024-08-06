part of 'event_filter_bloc.dart';

@immutable
final class EventFilterState {

  int selectedCategories;
  int selectedDateTimeIndex;
  double minPriceValue;
  double maxPriceValue;

  EventFilterState({this.selectedCategories = 0, this.selectedDateTimeIndex = 0 , this.minPriceValue = 40 , this.maxPriceValue = 450});


  EventFilterState copy() {
    return EventFilterState(selectedCategories: selectedCategories , selectedDateTimeIndex:  selectedDateTimeIndex, minPriceValue: minPriceValue , maxPriceValue: maxPriceValue);
  }
}
