import 'package:bloc/bloc.dart';
import 'package:jiocinema_clone/Utilities/GlobalFunctions.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void checkFirstAppear() async {
    final isFirstVisit = await PreferenceUtils.instance.getBool(PreferenceKey.firstAppearance);
    print(isFirstVisit);
    if (isFirstVisit != null && isFirstVisit) {
      emit(SplashLoginScreenState());
    }else{
      emit(SplashIntroductionState());
    }
  }
}
