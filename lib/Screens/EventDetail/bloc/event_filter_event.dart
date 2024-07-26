part of 'event_filter_bloc.dart';

@immutable
sealed class EventFilterEvent {}

final class EventFilterChangeCategories extends EventFilterEvent {

    int currentSelection;

    EventFilterChangeCategories({ required this.currentSelection});
}

final class EventFilterDateTimeChange extends EventFilterEvent {

    int currentSelection;

    EventFilterDateTimeChange({required this.currentSelection});
}

final class EventFilterPriceRangeChangeEvent extends EventFilterEvent {

    double minValue;
    double maxValue;

    EventFilterPriceRangeChangeEvent({required this.minValue , required this.maxValue});
}