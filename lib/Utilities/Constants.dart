import 'dart:ui';

import 'package:jiocinema_clone/Utilities/AppStyling.dart';

class AppImages {

  static String imagePath = "assets/images/";

  static String splashLogo = "${imagePath}splashLogo.svg";
  static String introSlider1 = "${imagePath}intro_slider1.svg";
  static String appLogo = "${imagePath}appLogo.svg";
  static String lgMail = "${imagePath}lg_Mail.svg";
  static String lgHidden = "${imagePath}lg_Hidden.svg";
  static String lgPassword = "${imagePath}lg_Password.svg";
  static String lgProfile = "${imagePath}lg_Profile.svg";
  static String lgContinueArrow = "${imagePath}continue_arrow.svg";
  static String facebook = "${imagePath}facebook.svg";
  static String google = "${imagePath}google.svg";
  static String back = "${imagePath}Back.svg";

  //Dashboard Images
  static String dbNotification = "${imagePath}db_notification.svg";
  static String dbDropDown = "${imagePath}db_dropDown.svg";
  static String dbMenu = "${imagePath}db_menu.svg";
  static String dbFilter = "${imagePath}db_filter.svg";
  static String dbSearch = "${imagePath}db_search.svg";
  static String dbFood = "${imagePath}db_Food.svg";
  static String dbSports = "${imagePath}db_Sports.svg";
  static String dbMusic = "${imagePath}db_Music.svg";
  static String dbArt = "${imagePath}db_Art.svg";
  static String dbSeeAll = "${imagePath}db_seeAll.svg";
  static String dbEventCard = "${imagePath}db_eventCard.svg";
  static String dbPeopleGroup = "${imagePath}db_pepoleGroup.svg";
  static String dbLocation = "${imagePath}db_location.svg";
  static String dbSave = "${imagePath}db_save.svg";
  static String dbOfferCard = "${imagePath}db_offerCard.svg";
  static String dbOfferCard1 = "${imagePath}db_offerCard1.png";
}

class Constants {

  //Dashboard arrays
  static const List<String> eventWiseFilter = ["Sports", "Music" , "Food" , "Art"];
  static List<String> eventWiseFilterIcon = [AppImages.dbSports, AppImages.dbMusic , AppImages.dbFood , AppImages.dbArt];
  static List<Color> eventWiseFilterColor = [AppColor.red, AppColor.orange , AppColor.green , AppColor.secondaryColor];
}