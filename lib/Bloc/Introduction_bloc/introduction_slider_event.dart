part of 'introduction_slider_bloc.dart';

@immutable
sealed class IntroductionSliderEvent {}


final class IntroSkipBtnTap extends IntroductionSliderEvent {

}

final class IntroNextBtnTap extends IntroductionSliderEvent {

   IntroNextBtnTap(this.currentPosition);

   int currentPosition;


}