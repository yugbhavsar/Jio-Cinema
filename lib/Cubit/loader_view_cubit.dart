import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loader_view_state.dart';

class LoaderViewCubit extends Cubit<LoaderViewState> {
  LoaderViewCubit() : super(LoaderViewState(false ,false , 50 , -50));

  void showLoader(){
    state.isLoading = true;
    emit(state.copy());
  }

  void hideLoader(){
    state.isLoading = false;
    emit(state.copy());
  }

  void showDialogueBox() {
    state.dialogueBoxPosition = 50;
    emit(state.copy());
    Future.delayed(const Duration(seconds: 5),() {
      removeDialogueBox();
    },);
  }

  void removeDialogueBox() {
    state.dialogueBoxPosition = -50;
    emit(state.copy());
  }

}
