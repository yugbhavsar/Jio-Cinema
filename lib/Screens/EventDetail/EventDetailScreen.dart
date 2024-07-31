import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Utilities.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
            title: "Event Details",
            titleColor: Colors.white,
            leadingIcon: AppImages.back,
            leadingIconColor: Colors.white,
            isHaveSuffixAction: true,
            actions: [AppImages.saveWhite],
            leadingIconOnTap: (){
              BlocProvider.of<ThemeStyleCubit>(context).changeNavColor(barColor: AppColor.primaryColor);
              Navigator.pop(context);
          }, actionOnTap: (index ) {  }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Image.asset(AppImages.eventImage77 , fit: BoxFit.fitWidth,width: MediaQuery.of(context).size.width,),

            Transform.translate(
              offset: const Offset(0, -30),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 1.5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                margin:  const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(AppImages.groupImage , fit: BoxFit.fill, height: 40,),

                      Text("+ 20 Going",style: appTextStyle(fontSize: 16,fontType: FontType.semiBold , textColor: AppColor.primaryColor),),

                      appNormalButton(title: "INVITE")
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: Stack(
                children:[
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("International Band Music Concert",style: appTextStyle(fontSize: 35,fontType: FontType.medium500 , textColor: AppColor.black),),
                  
                            appSizeBox(height: 20),
                  
                            eventDetails(eventImage: AppImages.calendar ,isPng:false,eventDate: "14 December, 2021",eventTime: "Tuesday, 4:00PM - 9:00PM"),
                  
                            appSizeBox(height: 20),
                  
                            eventDetails(eventImage: AppImages.location ,isPng:false,eventDate: "Gala Convention Center",eventTime: "36 Guild Street London, UK"),
                  
                            appSizeBox(height: 20),
                  
                            eventDetails(eventImage: AppImages.profileIcon_1 ,isPng:true,eventDate: "Ashfak Sayem",eventTime: "Organizer",padding: 0 , imageHeight: 48, haveSuffixButton: true),
                  
                            appSizeBox(height: 30),
                  
                            Text("About Event",style: appTextStyle(fontSize: 18,fontType: FontType.medium , textColor: AppColor.black),),
                            appSizeBox(height: 10),
                  
                            Text(Constants.eventDetails,style: appTextStyle(fontSize: 16,fontType: FontType.medium500 , textColor: AppColor.black),),

                            appSizeBox(height: 100)
                          ],
                        )
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white.withOpacity(0.1),Colors.white.withOpacity(0.3),Colors.white.withOpacity(0.5),Colors.white.withOpacity(0.7),Colors.white]
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: customButton(buttonName: "BUT TICKET \$120", onTap: (){})
                    ),
                  ),

              ]
              ),
            ),
        ],
      ),
    );
  }
}


Widget eventDetails({
  required String eventImage,
  required bool isPng,
  required String eventDate,
  required String eventTime,
  double padding = 9,
  double imageHeight = 30,
  bool haveSuffixButton = false,
}) {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(color: AppColor.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: isPng ? Image.asset(eventImage, fit: BoxFit.fill,height: imageHeight,):SvgPicture.asset(eventImage, fit: BoxFit.fill,height: imageHeight,)
      ),

      appSizeBox(width: 20),

      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(eventDate,style: appTextStyle(fontSize: 16,fontType: FontType.semiBold , textColor: AppColor.black),),
          Text(eventTime,style: appTextStyle(fontSize: 14,fontType: FontType.medium500 , textColor: AppColor.black),),
        ],
      ),

      Expanded(child: appSizeBox()),

      haveSuffixButton ? InkWell(
        onTap: (){},
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),
            decoration: BoxDecoration(color: AppColor.primaryColor.withOpacity(0.2),borderRadius: BorderRadius.circular(8)),
            child: Text("Follow" ,style: appTextStyle(fontType: FontType.medium , fontSize: 18 , textColor: AppColor.primaryColor),)
        ),
      ):appSizeBox()

    ],
  );
}