import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Utilities/AppStyling.dart';
import '../../../Utilities/Constants.dart';
import '../../../Utilities/Utilities.dart';
import '../../EventDetail/EventListScreen.dart';
import '../bloc/my_profile_bloc.dart';


class EditActionButtons extends StatelessWidget {

  EditActionButtons({
    super.key,
    required this.isMyProfile,
  });

  bool isMyProfile = true;

  @override
  Widget build(BuildContext context) {
    if (isMyProfile){
      return IntrinsicWidth(
          child: customButton(
              buttonName: "Edit Profile",
              textColor: AppColor.primaryColor,
              buttonHeight: 60,
              isSuffixIconVisible: false,
              isPrefixIconVisible: true,
              prefixIcon: AppImages.editProfile,
              backgroundColor: AppColor.white,
              borderColor: AppColor.primaryColor,
              onTap: () {}
          )
      );
    }else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IntrinsicWidth(
              child: customButton(
                  buttonName: "Follow",
                  textColor: AppColor.white,
                  buttonHeight: 60,
                  isSuffixIconVisible: false,
                  isPrefixIconVisible: true,
                  prefixIcon: AppImages.followProfile,
                  backgroundColor: AppColor.primaryColor,
                  borderColor: AppColor.primaryColor,
                  onTap: () {}
              )
          ),

          IntrinsicWidth(
              child: customButton(
                  buttonName: "Massages",
                  textColor: AppColor.primaryColor,
                  buttonHeight: 60,
                  isSuffixIconVisible: false,
                  isPrefixIconVisible: true,
                  prefixIcon: AppImages.messagesColor,
                  backgroundColor: AppColor.white,
                  borderColor: AppColor.primaryColor,
                  onTap: () {}
              )
          )
        ],
      );
    }
  }
}


class ProfileTabBarSection extends StatelessWidget {
  ProfileTabBarSection({super.key , required this.tabChange});
  
  VoidCallback tabChange;
  
  @override
  Widget build(BuildContext context) {
    final controller = context.read<MyProfileBloc>().controller;
    return BlocBuilder<MyProfileBloc, MyProfileState >(
  builder: (context, state) {
    return Column(
      children: [
        TabBar(
          controller: controller,
          dividerHeight: 0,
          indicatorColor: AppColor.primaryColor,
          tabs: [
            Text("ABOUT", style: appTextStyle(
                fontType: FontType.medium,
                fontSize: 18,
                textColor: controller.index == 0 ? AppColor
                    .primaryColor : AppColor.textGray),),

            Text("EVENT", style: appTextStyle(
                fontType: FontType.medium,
                fontSize: 18,
                textColor: controller.index == 1 ? AppColor
                    .primaryColor : AppColor.textGray),),

            Text("REVIEWS", style: appTextStyle(
                fontType: FontType.medium,
                fontSize: 18,
                textColor: controller.index == 2 ? AppColor
                    .primaryColor : AppColor.textGray),)
          ],
          onTap: (value) => tabChange(),
        ),

        appSizeBox(height: 10),

        SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: TabBarView(
            controller: controller,
            children: [

              Column(
                children: [

                  appSizeBox(height: 20),

                  Text("Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More",
                    style: appTextStyle(fontType: FontType.medium500 , fontSize: 16 , textColor: AppColor.black),
                  ),
                ],
              ),

              SingleChildScrollView(
                child: Column(
                  children: List.generate(5, (index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: EventTitleDateTimeCard(),
                      );
                  },),
                ),
              ),

              SingleChildScrollView(
                child: Column(
                  children: List.generate(5, (index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ReviewProfileCard(),
                    );
                  },),
                ),
              )
            ],

          ),
        )
      ],
    );
  },
);
  }
}


class AboutMeProfile extends StatelessWidget {

  AboutMeProfile({super.key});

  final interest = ["Game Online","Concert","Music","Art","Movie","Others"];
  final interestColor = [AppColor.primaryLightColor,AppColor.redLight,AppColor.orange,AppColor.primary3Color,AppColor.green,AppColor.secondaryColor];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("About Me", style: appTextStyle(fontType: FontType.medium , fontSize: 20 , textColor: AppColor.black),),

            Expanded(child: appSizeBox())
          ],
        ),

        appSizeBox(height: 20),

        Center(
          child: Text("Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More",
            style: appTextStyle(fontType: FontType.medium500 , fontSize: 16 , textColor: AppColor.black),
          ),
        ),

        appSizeBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Interest", style: appTextStyle(fontType: FontType.medium , fontSize: 20 , textColor: AppColor.black),),

            IntrinsicWidth(
              child: customButton(
                  buttonName: "Change",
                  isPrefixIconVisible: true,
                  isSuffixIconVisible: false,
                  borderColor: Colors.transparent,
                  prefixIcon: AppImages.intrestEdit,
                  backgroundColor: AppColor.primaryOpacityColor,
                  textColor: AppColor.primaryColor,
                  textSize: 14,
                  roundBorder: 40,
                  buttonHeight: 20,
                  onTap: (){}
              ),
            )
          ],
        ),

        appSizeBox(height: 10),

        Wrap(
          children: List.generate(interest.length, (index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: interestColor[index]),
              child: Text(interest[index] , style:appTextStyle(fontType: FontType.medium , fontSize: 18 , textColor: AppColor.white),) ,
            );
          },),
        )
      ],
    );
  }
}


class ReviewProfileCard extends StatelessWidget {
  const ReviewProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.profile4 , fit: BoxFit.fill,),

              appSizeBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rocks Velkeinjen" , style: appTextStyle(fontType: FontType.medium , fontSize: 18 , textColor: Colors.black),),
                    appSizeBox(height: 5),
                    Row(
                      children: List.generate(4, (index) => SvgPicture.asset(AppImages.star , fit: BoxFit.fill,),),
                    ),
                    appSizeBox(height: 15),

                    Text(
                      "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you." ,
                      style: appTextStyle(fontType: FontType.medium500 , fontSize: 18 , textColor: Colors.black),
                    ),
                  ],
                ),
              ),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: appSizeBox(),),

              Text("10 Feb" , style: appTextStyle(fontType: FontType.medium500 , fontSize: 18 , textColor: AppColor.textGray),),
            ],
          ),
        ]
    );
  }
}
