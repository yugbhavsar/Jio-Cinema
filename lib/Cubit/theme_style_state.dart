part of 'theme_style_cubit.dart';

@immutable

sealed class ThemeStyleState {}

final class ThemeStyleInitial extends ThemeStyleState {
  bool isPrimary;
  ThemeStyleInitial(this.isPrimary);
}

final class ThemeStyleNavColorPrimary extends ThemeStyleState {
    bool isPrimary;
    ThemeStyleNavColorPrimary(this.isPrimary);
}