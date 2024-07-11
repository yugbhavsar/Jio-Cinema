import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:meta/meta.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

part 'side_drawer_event.dart';
part 'side_drawer_state.dart';

class SideDrawerBloc extends Bloc<SideDrawerEvent, SideDrawerState> {

  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  final List<String> drawerIcon = [
    AppImages.menuProfile,
    AppImages.menuMessage,
    AppImages.menuCalendar,
    AppImages.menuBookmark,
    AppImages.menuContactUs,
    AppImages.menuSetting,
    AppImages.menuHelp,
    AppImages.menuLogout
  ];

  final List<String> drawerTitle = [
    "My Profile",
    "Message",
    "Calendar",
    "Bookmark",
    "Contact Us",
    "Setting",
    "Help & FAQs",
    "Sign Out"
  ];

  SideDrawerBloc() : super(SideDrawerInitial()) {
    on<SideDrawerEvent>((event, emit) {

    });
  }
}
