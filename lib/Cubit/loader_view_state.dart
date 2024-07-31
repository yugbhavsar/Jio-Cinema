part of 'loader_view_cubit.dart';

class LoaderViewState {
  bool isLoading;
  bool dialogueVisible;
  double dialogueBoxHeight;
  double dialogueBoxPosition;

  LoaderViewState(this.isLoading , this.dialogueVisible ,this.dialogueBoxHeight , this.dialogueBoxPosition);

  LoaderViewState copy() {
    return LoaderViewState(isLoading, dialogueVisible ,dialogueBoxHeight, dialogueBoxPosition);
  }

}
