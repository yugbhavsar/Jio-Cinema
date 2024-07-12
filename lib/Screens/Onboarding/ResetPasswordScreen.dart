import 'package:flutter/material.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(leadingIcon: AppImages.back,leadingIconOnTap: (){
          Navigator.pop(context);
      }, actionOnTap: (int ) {  }),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appSizeBox(height: 20),
              Text("Reset Password", style: appTextStyle(fontSize: 28, textColor: AppColor.darkTextColor,fontType: FontType.bold),),

              appSizeBox(height: 10),
              Container(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text("Please enter your email address to request a password reset", style: appTextStyle(fontSize: 20, textColor: AppColor.black,fontType: FontType.medium500),)
              ),

              appSizeBox(height: 30),
              customTextField(context: context, controller: emailController, hintText: "abc@mail.com",prefixIcon: AppImages.lgMail),

              appSizeBox(height: 50),
              
              customButton(buttonName: "SEND", onTap: (){

              })
              
            ],
          ),
        ),
      ),
    );
  }
}
