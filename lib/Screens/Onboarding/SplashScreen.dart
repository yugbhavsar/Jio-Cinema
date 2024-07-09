import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(AppImages.splashLogo,height: 60,)
            )
        ),
      ),
    );
  }
}
