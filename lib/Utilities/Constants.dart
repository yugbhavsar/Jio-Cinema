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

  //Event Details Screen
  static String eventImage77 = "${imagePath}image 77.png";
  static String profileIcon_1 = "${imagePath}profileImage1.png";
  static String location = "${imagePath}location.svg";
  static String calendar = "${imagePath}calendar.svg";
  static String saveWhite = "${imagePath}save_white.svg";
  static String groupImage = "${imagePath}Group.png";
  static String searchBlack = "${imagePath}search_black.svg";
  static String more = "${imagePath}more.svg";

  //SideDrawer
  static String profile2 = "${imagePath}profile2.png";
  static String menuPremium = "${imagePath}menu_premium.svg";
  static String menuHelp = "${imagePath}menu_help.svg";
  static String menuContactUs = "${imagePath}menu_contactUs.svg";
  static String menuProfile = "${imagePath}menu_profile.svg";
  static String menuSetting = "${imagePath}menu_setting.svg";
  static String menuCalendar = "${imagePath}menu_calendar.svg";
  static String menuBookmark = "${imagePath}menu_bookmark.svg";
  static String menuLogout = "${imagePath}menu_logout.svg";
  static String menuMessage = "${imagePath}menu_message.svg";

}

class Constants {

  //Dashboard arrays
  static const List<String> eventWiseFilter = ["Sports", "Music" , "Food" , "Art"];
  static List<String> eventWiseFilterIcon = [AppImages.dbSports, AppImages.dbMusic , AppImages.dbFood , AppImages.dbArt];
  static List<Color> eventWiseFilterColor = [AppColor.red, AppColor.orange , AppColor.green , AppColor.secondaryColor];

  static const eventDetails = "Launched in April 2006 as a statistical machine translation service, it originally used United Nations and European Parliament documents and transcripts to gather linguistic data. Rather than translating languages directly, it first translated text to English and then pivoted to the target language in most of the language combinations it posited in its grid,[7] with a few exceptions including Catalan–Spanish.[8] During a translation, it looked for patterns in millions of documents to help decide which words to choose and ";
}