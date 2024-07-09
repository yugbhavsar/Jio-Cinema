import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_style_state.dart';

class ThemeStyleCubit extends Cubit<ThemeStyleState> {

  ThemeStyleCubit(): super(ThemeStyleInitial(false));

  void changeNavColor(bool isPrimaryColor) {
      emit(ThemeStyleNavColorPrimary(isPrimaryColor));
  }

}
