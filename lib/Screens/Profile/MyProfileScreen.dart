import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Screens/Profile/bloc/my_profile_bloc.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/GlobalFunctions.dart';
import 'package:jiocinema_clone/Utilities/Utilities.dart';

import 'widgets/MyProfileWidgets.dart';

class MyProfileScreen extends StatefulWidget  {

  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> with SingleTickerProviderStateMixin {

  late MyProfileBloc _bloc;

  @override
  void initState() {
    _bloc = MyProfileBloc(provider: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => _bloc,
  child: Scaffold(
      appBar: customAppBar(
          title: "Profile",
          titleColor: AppColor.black,
          leadingIcon: AppImages.back,
          leadingIconOnTap: (){
            Navigator.pop(context);
            context.read<ThemeStyleCubit>().changeNavColor(barColor: AppColor.primaryColor);
            GlobalFunctions.openSideMenu(context);
          },
          actionOnTap: (index){}
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [

                appSizeBox(height: 30),

                CircleAvatar(
                    radius: 60,
                    child: Image.asset(AppImages.profile3, fit: BoxFit
                        .fill)
                ),

                appSizeBox(height: 10),

                Text(
                  "Ashfak Sayem", style: appTextStyle(fontType: FontType
                    .bold, fontSize: 24, textColor: AppColor.black),),

                appSizeBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("358", style: appTextStyle(
                            fontType: FontType.semiBold,
                            fontSize: 18,
                            textColor: AppColor.black),),

                        Text("Following", style: appTextStyle(
                            fontType: FontType.medium500,
                            fontSize: 16,
                            textColor: AppColor.black),),
                      ],
                    ),

                    appSizeBox(width: 20),
                    Container(height: 40,
                      width: 2,
                      color: AppColor.gray,),
                    appSizeBox(width: 20),

                    Column(
                      children: [
                        Text("358", style: appTextStyle(
                            fontType: FontType.semiBold,
                            fontSize: 18,
                            textColor: AppColor.black),),

                        Text("Following", style: appTextStyle(
                            fontType: FontType.medium500,
                            fontSize: 16,
                            textColor: AppColor.black),),
                      ],
                    )
                  ],
                ),

                appSizeBox(height: 20),

                EditActionButtons(isMyProfile: false,),

                appSizeBox(height: 30),

                BlocBuilder<MyProfileBloc , MyProfileState>(builder: (context, state) {
                  return state.isMyProfile ?
                  AboutMeProfile()
                      :
                  ProfileTabBarSection(tabChange: (){
                    context.read<MyProfileBloc>().add(ProfileTabChangeEvent());
                  },);
                },)



              ],
            ),
          )
        ),
      ),
    ),
);
  }
}




