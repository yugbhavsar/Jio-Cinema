import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {

  final TickerProvider provider;
  late TabController controller;

  MyProfileBloc({ required this.provider }) : super(MyProfileState(isMyProfile: false)) {
    controller = TabController(length: 3, vsync: provider);
    on<MyProfileEvent>((event, emit) {

    });

    on<ProfileTabChangeEvent>((event, emit) {
      emit(MyProfileState(isMyProfile: false));
    },);
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
