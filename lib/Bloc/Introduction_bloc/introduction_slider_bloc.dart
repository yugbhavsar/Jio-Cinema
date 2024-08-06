import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Utilities/GlobalFunctions.dart';

part 'introduction_slider_event.dart';
part 'introduction_slider_state.dart';

class IntroductionSliderBloc extends Bloc<IntroductionSliderEvent, IntroductionSliderState> {

  IntroductionSliderBloc() : super(IntroductionSliderInitial()) {
    on<IntroductionSliderEvent>((event, emit) {

    });

    on<IntroSkipBtnTap>((event, emit) async {
        await PreferenceUtils.instance.setBool(PreferenceKey.firstAppearance, true);
        emit(IntroductionSkipState());
    });

    on<IntroNextBtnTap>((event, emit) async {
      String title = "";
      String subTitle = "";
      if (event.currentPosition == 0) {
        title = "Web Have Modern Events Calendar Feature";
        subTitle = "In publishing and graphic design, Lorem is a placeholder text commonly";
      }else {
        title = "To Look Up More Events or Activities Nearby By Map";
        subTitle = "In publishing and graphic design, Lorem is a placeholder text commonly";
        await PreferenceUtils.instance.setBool(PreferenceKey.firstAppearance, true);
      }
      emit(IntroductionNextState(event.currentPosition+1,title,subTitle));
    });
  }

}
