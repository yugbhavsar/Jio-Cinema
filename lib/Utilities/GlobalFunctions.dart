import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Screens/SideDrawer/bloc/side_drawer_bloc.dart';



class GlobalFunctions {

  GlobalFunctions.internal();

  static final GlobalFunctions _instance = GlobalFunctions.internal();

  // //With Factory Constructor
  // factory GlobalFunctions(){
  //   return _instance;
  // }

  //With static field
  static GlobalFunctions get instance => _instance;


  static openSideMenu(BuildContext context) {
    var state = context.read<SideDrawerBloc>().sideMenuKey.currentState;
    if (state?.isOpened ?? false) {
      context.read<SideDrawerBloc>().sideMenuKey.currentState?.closeSideMenu();
    }else{
      context.read<SideDrawerBloc>().sideMenuKey.currentState?.openSideMenu();
    }


  }

}