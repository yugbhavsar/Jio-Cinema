part of 'theme_style_cubit.dart';

@immutable

sealed class ThemeStyleState {}

final class ThemeStyleInitial extends ThemeStyleState {
  Color barColor;
  ThemeStyleInitial(this.barColor);
}

final class ThemeStyleNavColorPrimary extends ThemeStyleState {
    Color barColor = Colors.white;
    ThemeStyleNavColorPrimary(this.barColor);
}