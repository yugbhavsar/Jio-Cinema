import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Screens/SplashScreen/cubit/splash_cubit.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().checkFirstAppear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashIntroductionState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.introductionScreen, (route) => false);
            } else if (state is SplashLoginScreenState) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteName.loginScreen, (route) => false);
            } else if (state is SplashInitial ){
              print("time login ");
            }
          },
          child: Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SvgPicture.asset(AppImages.splashLogo, height: 60,)
              )
          ),
        ),
      ),
    );
  }
}
