import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilities.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  appSizeBox(height: 50),

                  SvgPicture.asset(AppImages.appLogo , fit: BoxFit.fill,),

                  Text("EventHub", style: appTextStyle(fontSize: 48, textColor: AppColor.darkTextColor,fontType: FontType.bold),),

                  appSizeBox(height: 30),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Sign in", style: appTextStyle(fontSize: 28, textColor: AppColor.darkTextColor,fontType: FontType.bold),),
                    ],
                  ),

                  appSizeBox(height: 30),
                  customTextField(
                    context: context,
                    controller: emailController,
                    hintText: "abc@mail.com",
                    showPrefixIcon: true,
                    prefixIcon: AppImages.lgMail
                  ),

                  appSizeBox(height: 20),
                  customTextField(
                    context: context,
                    controller: passwordController,
                    hintText: "Your Password",
                    showPrefixIcon: true,
                    prefixIcon: AppImages.lgPassword,
                    showSuffixIcon: true,
                    suffixIcon: AppImages.lgHidden
                  ),

                  appSizeBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Switch(
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: AppColor.borderGray,
                            focusColor: AppColor.primaryColor,
                            value: true ,
                            onChanged: (value) {
                          
                          },),
                          Text("Remember Me",style: appTextStyle(fontSize: 16 , fontType: FontType.medium500,textColor: AppColor.black),)
                        ],
                      ),

                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.resetPasswordScreen);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                              child: Text("Forgot Password?",style: appTextStyle(fontSize: 16 , fontType: FontType.medium500,textColor: AppColor.black),)
                          )
                      ),
                    ],
                  ),

                appSizeBox(height: 40),

                customButton(buttonName: "SIGN IN" , onTap: (){
                    Navigator.pushNamed(context, RouteName.otpVerificationScreen);
                }),

                appSizeBox(height: 20),
                Text("OR",style: appTextStyle(fontSize: 20 , fontType: FontType.bold,textColor: AppColor.textGray),),
                appSizeBox(height: 20),

                ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      backgroundColor: Colors.white
                    ),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: appSizeBox()),
                          SvgPicture.asset(AppImages.google ,fit: BoxFit.fill,),
                          appSizeBox(width: 20),
                          Text("Login With Google",style: appTextStyle(fontSize: 18 , fontType: FontType.semiBold,textColor: AppColor.black),),
                          Expanded(child: appSizeBox()),
                        ],
                      ),
                    )
                ),
                appSizeBox(height: 10),
                ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        backgroundColor: Colors.white
                    ),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: appSizeBox()),
                          SvgPicture.asset(AppImages.facebook ,fit: BoxFit.fill,),
                          appSizeBox(width: 20),
                          Text("Login With Facebook",style: appTextStyle(fontSize: 18 , fontType: FontType.semiBold,textColor: AppColor.black),),
                          Expanded(child: appSizeBox()),
                        ],
                      ),
                    )
                ),
                appSizeBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: appTextStyle(fontSize: 16 , fontType: FontType.medium500,textColor: AppColor.darkTextColor)),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.signupScreen);
                        },
                        child: Text("Sign up",style: appTextStyle(fontSize: 16 , fontType: FontType.medium500,textColor: AppColor.primaryColor))
                      ),
                    ],
                ),
                appSizeBox(height: 10),
              ],
            ),
          ),
        ),
      )
    );
  }
}
