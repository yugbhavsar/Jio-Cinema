import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_style_state.dart';

class ThemeStyleCubit extends Cubit<ThemeStyleState> {

  ThemeStyleCubit(): super(ThemeStyleInitial(Colors.white));

  void changeNavColor({Color barColor = Colors.white}) {
      emit(ThemeStyleNavColorPrimary(barColor));
  }

}
