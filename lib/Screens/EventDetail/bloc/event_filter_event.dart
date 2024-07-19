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