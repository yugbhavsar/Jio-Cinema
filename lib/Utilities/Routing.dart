import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Bloc/Introduction_bloc/introduction_slider_bloc.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Screens/Dashboard/DashboardScreen.dart';
import 'package:jiocinema_clone/Screens/Onboarding/IntroductionSlideScreen.dart';
import 'package:jiocinema_clone/Screens/Onboarding/LoginScreen.dart';
import 'package:jiocinema_clone/Screens/Onboarding/OtpVerificationScreen.dart';
import 'package:jiocinema_clone/Screens/Onboarding/ResetPasswordScreen.dart';
import 'package:jiocinema_clone/Screens/Onboarding/SignupScreen.dart';
import 'package:jiocinema_clone/Screens/Onboarding/SplashScreen.dart';

class RouteName {

  static const String splashScreen = "SplashScreen";
  static const String dashboard = "DashboardScreen";
  static const String loginScreen = "LoginScreen";
  static const String introductionScreen = "IntroductionScreen";
  static const String signupScreen = "SignupScreen";
  static const String otpVerificationScreen = "OtpVerificationScreen";
  static const String resetPasswordScreen = "ResetPasswordScreen";
}

class AppRoute {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name){
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),settings: const RouteSettings(name: RouteName.splashScreen));
      case RouteName.dashboard:
        return MaterialPageRoute(builder: (context) => DashboardScreen(),settings: const RouteSettings(name: RouteName.dashboard));
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen(),settings: const RouteSettings(name: RouteName.loginScreen));
      case RouteName.introductionScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => IntroductionSliderBloc(),
              child: const IntroductionSlideScreen(),),
            settings: const RouteSettings(name: RouteName.introductionScreen)
        );
      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen(),settings: const RouteSettings(name: RouteName.signupScreen));
      case RouteName.otpVerificationScreen:
        return MaterialPageRoute(
            builder: (context) => OtpVerificationScreen(),
            settings: const RouteSettings(name: RouteName.otpVerificationScreen)
        );
      case RouteName.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => ResetPasswordScreen(),settings: const RouteSettings(name: RouteName.resetPasswordScreen));
      default:
        return MaterialPageRoute(builder: (context) => DashboardScreen(),settings: const RouteSettings(name: RouteName.loginScreen));
    }
  }
}