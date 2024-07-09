part of 'introduction_slider_bloc.dart';

@immutable
sealed class IntroductionSliderState {}

final class IntroductionSliderInitial extends IntroductionSliderState {
  String titleString = "Explore Upcoming and Nearby Events";
  String subtitleString = "In publishing and graphic design, Lorem is a placeholder text commonly";

  IntroductionSliderInitial();
}

final class IntroductionSkipState extends IntroductionSliderState {}

final class IntroductionNextState extends IntroductionSliderState {
  int currentPosition;
  String titleString;
  String subtitleString;

  IntroductionNextState(this.currentPosition,this.titleString,this.subtitleString);
}