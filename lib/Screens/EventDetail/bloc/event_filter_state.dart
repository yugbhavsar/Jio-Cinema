part of 'event_filter_bloc.dart';

@immutable
sealed class EventFilterState {}

final class EventFilterInitial extends EventFilterState {

  int selectedCategories = 0 ;

}

final class EventFilterCategoriesChangeState extends EventFilterState {
  EventFilterCategoriesChangeState(this.selectedIndex);

    int selectedIndex;
}

final class EventFilterChangeDateTimeSelection extends EventFilterState {

  EventFilterChangeDateTimeSelection({required this.selectedIndex});

  int selectedIndex;
}
