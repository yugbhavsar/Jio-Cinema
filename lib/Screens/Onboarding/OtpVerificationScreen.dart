import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';


class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  FocusNode otp1Node = FocusNode();
  FocusNode otp2Node = FocusNode();
  FocusNode otp3Node = FocusNode();
  FocusNode otp4Node = FocusNode();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(
          title: "",
          leadingIcon: AppImages.back,
        leadingIconOnTap: (){
            Navigator.pop(context);
        }
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appSizeBox(height: 20),
                Text("Verification", style: appTextStyle(fontSize: 28, textColor: AppColor.darkTextColor,fontType: FontType.bold),),

                appSizeBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(right: 50),
                    child: Text("We’ve send you the verification code on +1 2620 0323 7631", style: appTextStyle(fontSize: 20, textColor: AppColor.black,fontType: FontType.medium500),)
                ),

                appSizeBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // customTextField(context: context, controller: otpController, hintText: "" , showPrefixIcon: false),
                    // customTextField(context: context, controller: otpController, hintText: "", showPrefixIcon: false),
                    // customTextField(context: context, controller: otpController, hintText: "", showPrefixIcon: false),
                    // customTextField(context: context, controller: otpController, hintText: "", showPrefixIcon: false),

                    customOtpTextField(context: context , controller: otp1Controller , hintText:  "",currentNode: otp1Node,nextNode: otp2Node),
                    customOtpTextField(context: context , controller: otp2Controller , hintText:  "",currentNode: otp2Node,nextNode: otp3Node),
                    customOtpTextField(context: context , controller: otp3Controller , hintText:  "",currentNode: otp3Node,nextNode: otp4Node),
                    customOtpTextField(context: context , controller: otp4Controller , hintText:  "",currentNode: otp4Node,isLastField: true),
                  ],
                ),

                appSizeBox(height: 40),
                customButton(buttonName: "Continue", onTap: (){
                    BlocProvider.of<ThemeStyleCubit>(context).changeNavColor(barColor: AppColor.primaryColor);
                    Navigator.pushNamedAndRemoveUntil(context, RouteName.dashboard, (route) => false,);
                }),

                appSizeBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Re-send code in", style: appTextStyle(fontSize: 18, textColor: AppColor.black,fontType: FontType.medium500),),
                    appSizeBox(height: 0,width: 5),
                    Text("0:20", style: appTextStyle(fontSize: 18, textColor: AppColor.primaryColor,fontType: FontType.medium),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
