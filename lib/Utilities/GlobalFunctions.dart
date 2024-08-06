import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:jiocinema_clone/Screens/SideDrawer/bloc/side_drawer_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppStyling.dart';

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


  static showAlertMessage({required BuildContext context ,required String message ,required int code}){

    IconSnackBar.show(
      context,
      label: message,
      direction:  DismissDirection.up,
      snackBarStyle: SnackBarStyle(
          backgroundColor: (code == 200)  ? AppColor.green:AppColor.red ,
          maxLines: 5 ,
          iconColor: AppColor.white,
          labelTextStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800)),
      snackBarType: (code == 200)  ? SnackBarType.success:SnackBarType.fail,
      duration: const Duration(seconds: 3),
    );
  }

}




class PreferenceUtils {
  PreferenceUtils.internal();

  static final PreferenceUtils _instance = PreferenceUtils.internal();

  SharedPreferences? _preferences;

  static PreferenceUtils get instance => _instance;

  Future<void> init()  async {
    _preferences = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _preferences!.setString(key, value);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  Future<bool> setInt(String key, int value) {
    print("done");
    return _preferences!.setInt(key, value);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences!.setBool(key, value);
  }

}

class PreferenceKey {

  static String firstAppearance = "isFirstAppear";
}