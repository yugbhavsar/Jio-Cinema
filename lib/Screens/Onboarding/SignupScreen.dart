import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/loader_view_cubit.dart';
import 'package:jiocinema_clone/Repository/APIHelper.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilities.dart';




class SignupScreen extends StatelessWidget {

  SignupScreen({super.key});

  TextEditingController fullNameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
  TextEditingController conformPassController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
          leading: Container(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: SvgPicture.asset(AppImages.back , fit: BoxFit.fill,height: 30,width: 30,),
              onPressed: () {
                Navigator.pop(context);
              },),
          )
      ),
      child: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  appSizeBox(height: 40),
                  Text("Sign up", style: appTextStyle(fontSize: 28, textColor: AppColor.darkTextColor,fontType: FontType.bold),)
                ],
              ),

              appSizeBox(height: 40),
              customTextField(
                  context: context,
                  controller: fullNameController,
                  hintText: "Full name",
                  showPrefixIcon: true,
                  prefixIcon: AppImages.lgProfile
              ),
              appSizeBox(height: 20),
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
                  hintText: "Your password",
                  showPrefixIcon: true,
                  prefixIcon: AppImages.lgPassword,
                  showSuffixIcon: true,
                  suffixIcon: AppImages.lgHidden
              ),
              appSizeBox(height: 20),
              customTextField(
                  context: context,
                  controller: conformPassController,
                  hintText: "Confirm password",
                  showPrefixIcon: true,
                  prefixIcon: AppImages.lgPassword,
                  showSuffixIcon: true,
                  suffixIcon: AppImages.lgHidden
              ),

              appSizeBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appSizeBox(),

                  InkWell(
                    child: Text(
                      "Signup with mobile",
                      style: appTextStyle(fontType: FontType.medium500 , fontSize: 16 , textColor:AppColor.primaryColor),
                    ),
                    onTap: (){
                        context.read<LoaderViewCubit>().showDialogueBox();
                    },
                  )
                ],
              ),
              appSizeBox(height: 30),

              customButton(buttonName: "SIGN UP",onTap: (){
                context.read<LoaderViewCubit>().showLoader();
                API.internal().signupUser(emailController.text, passwordController.text,(){
                  context.read<LoaderViewCubit>().hideLoader();
                });
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
                      children: [
                        Expanded(child: appSizeBox()),
                        SvgPicture.asset(AppImages.google ,fit: BoxFit.fill,),
                        appSizeBox(width: 20),
                        Text("Signup With Google",style: appTextStyle(fontSize: 18 , fontType: FontType.semiBold,textColor: AppColor.black),),
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
                        Text("Signup With Facebook",style: appTextStyle(fontSize: 18 , fontType: FontType.semiBold,textColor: AppColor.black),),
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
                  Text("Already have an account?",style: appTextStyle(fontSize: 16 , fontType: FontType.medium500,textColor: AppColor.darkTextColor)),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, RouteName.loginScreen, (route) {
                          return false;
                        },);
                      },
                      child: Text("Signin",style: appTextStyle(fontSize: 16 , fontType: FontType.medium500,textColor: AppColor.primaryColor))
                  ),
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