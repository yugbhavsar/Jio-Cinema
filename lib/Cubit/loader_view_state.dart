part of 'loader_view_cubit.dart';

class LoaderViewState {
  bool isLoading;

  LoaderViewState(this.isLoading);

  LoaderViewState copy() {
    return LoaderViewState(isLoading);
  }

}
