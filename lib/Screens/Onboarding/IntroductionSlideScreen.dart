import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiocinema_clone/Bloc/Introduction_bloc/introduction_slider_bloc.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';


class IntroductionSlideScreen extends StatelessWidget {
  const IntroductionSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<IntroductionSliderBloc, IntroductionSliderState>(
            listener: (context, state) {
              if (state is IntroductionSkipState) {
                Navigator.pushNamedAndRemoveUntil(context, RouteName.loginScreen, (route) {
                  return false;
                },);
              }
              else if (state is IntroductionNextState) {
                if (state.currentPosition == 3) {
                  Navigator.pushNamedAndRemoveUntil(context, RouteName.loginScreen, (route) => false,);
                }
              }
            },
  child: Stack(
        children: [

          Center(child: SvgPicture.asset(AppImages.introSlider1 ,fit: BoxFit.fitHeight,)),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

            BlocBuilder<IntroductionSliderBloc , IntroductionSliderState>(builder: (context, state) {
              int current = 0;
              String title = "";
              String subtitle = "";

              if (state is IntroductionSliderInitial) {
                current = 0;
                title = state.titleString;
                subtitle = state.subtitleString;
              } else if (state is IntroductionNextState) {
                current = state.currentPosition;
                title = state.titleString;
                subtitle = state.subtitleString;
              }
              return
                Container(
                  height: 288,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45),
                          topLeft: Radius.circular(45)),
                      color: AppColor.primaryColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,
                        style: appTextStyle(fontType: FontType.bold,
                            fontSize: 22,
                            textColor: Colors.white),
                        textAlign: TextAlign.center,),

                      appSizeBox(height: 20),
                      Text(
                        subtitle,
                        style: appTextStyle(fontType: FontType.normal,
                            fontSize: 16,
                            textColor: Colors.white),
                        textAlign: TextAlign.center,),
                      const Expanded(child: SizedBox()),

                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<IntroductionSliderBloc>().add(
                                  IntroSkipBtnTap());
                            },
                            child: Text("Skip", style: appTextStyle(
                                fontSize: 16,
                                fontType: FontType.bold,
                                textColor: AppColor.gray),),
                          ),

                          const Expanded(child: SizedBox()),
                          Icon(Icons.circle,
                            color: current == 0 ? Colors.white : Colors.grey,
                            size: 15,),
                          appSizeBox(width: 5),
                          Icon(Icons.circle,
                            color: current == 1 ? Colors.white : Colors.grey,
                            size: 15,),
                          appSizeBox(width: 5),
                          Icon(Icons.circle,
                            color: current == 2 ? Colors.white : Colors.grey,
                            size: 15,),
                          const Expanded(child: SizedBox()),

                          InkWell(
                            onTap: () {
                              context.read<IntroductionSliderBloc>().add(
                                  IntroNextBtnTap(current));
                            },
                            child: Text("Next", style: appTextStyle(
                                fontSize: 16,
                                fontType: FontType.bold,
                                textColor: AppColor.gray),),
                          ),
                        ],
                      ),
                      appSizeBox(height: 20),
                    ],
                  ),
                );
            })
            ],
          )
        ],
      ),
),
    );
  }
}
