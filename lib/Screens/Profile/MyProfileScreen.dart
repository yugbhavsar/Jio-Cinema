import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Profile",
          titleColor: AppColor.black,
          leadingIcon: AppImages.back,
          leadingIconOnTap: (){
            Navigator.pop(context);
            context.read<ThemeStyleCubit>().changeNavColor(barColor: AppColor.primaryColor);
          },
          actionOnTap: (index){}
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              appSizeBox(height:  30),

              CircleAvatar(
                  radius: 60,
                  child: Image.asset(AppImages.profile3 , fit: BoxFit.fill)
              ),

              appSizeBox(height:  10),

              Text("Ashfak Sayem", style: appTextStyle(fontType: FontType.bold , fontSize: 24 , textColor: AppColor.black),),

              appSizeBox(height:  20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("358", style: appTextStyle(fontType: FontType.semiBold , fontSize: 18 , textColor: AppColor.black),),

                      Text("Following", style: appTextStyle(fontType: FontType.medium500 , fontSize: 16 , textColor: AppColor.black),),
                    ],
                  ),

                  appSizeBox(width: 20),
                  Container(height: 40,width: 2,color: AppColor.gray,),
                  appSizeBox(width: 20),

                  Column(
                    children: [
                      Text("358", style: appTextStyle(fontType: FontType.semiBold , fontSize: 18 , textColor: AppColor.black),),

                      Text("Following", style: appTextStyle(fontType: FontType.medium500 , fontSize: 16 , textColor: AppColor.black),),
                    ],
                  )
                ],
              ),

              appSizeBox(height:  20),

              IntrinsicWidth(
                child: ElevatedButton(
                  onPressed: (){
                
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(width: 1 , color:AppColor.primaryColor)),
                  ),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child : Row(
                        children: [
                          SvgPicture.asset(AppImages.editProfile,
                              fit: BoxFit.fill,
                              height: 25
                          ),

                          appSizeBox(width: 10),

                          Text("Edit Profile",style: appTextStyle(fontSize: 20 , fontType: FontType.bold , textColor: AppColor.primaryColor ))
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
