import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loader_view_state.dart';

class LoaderViewCubit extends Cubit<LoaderViewState> {
  LoaderViewCubit() : super(LoaderViewState(false));

  void showLoader(){
    state.isLoading = true;
    emit(state.copy());
  }

  void hideLoader(){
    state.isLoading = false;
    emit(state.copy());
  }

}
