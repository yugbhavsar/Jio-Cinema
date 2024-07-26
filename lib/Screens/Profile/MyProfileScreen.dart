import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Screens/SideDrawer/bloc/side_drawer_bloc.dart';
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
        child: SizedBox(
          width: double.infinity,
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


                ElevatedButton(
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: BorderSide(width: 1 , color:borderColor)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImages.editProfile,
                          fit: BoxFit.fill,
                          height: 25
                        ),

                        Text("Edit Profile",style: appTextStyle(fontSize: 20 , fontType: FontType.bold , textColor: AppColor.primaryColor ))
                      ],
                    )
                ),
                customButton(
                    buttonName: "Edit Profile",
                    backgroundColor: AppColor.white,
                    textColor: AppColor.primaryColor,
                    isPrefixIconVisible: true,
                    isSuffixIconVisible: false,
                    buttonHeight: 60,
                    prefixIcon: AppImages.editProfile,
                    onTap: (){

                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
