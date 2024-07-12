import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          leadingIcon: AppImages.back,
          leadingIconColor: Colors.black,
          title: "Event",
          titleColor: Colors.black,
          isHaveSuffixAction: true,
          actions: [AppImages.searchBlack , AppImages.more],
          leadingIconOnTap: (){
             context.read<ThemeStyleCubit>().changeNavColor(barColor: AppColor.primaryColor);
             Navigator.pop(context);
          },
          actionOnTap: (index) {
            print(index);
            Navigator.pushNamed(context, RouteName.eventFilterScreen);
          },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: AppColor.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          height: 90,
                          width: 75,
                          decoration: BoxDecoration(color: AppColor.orange , borderRadius: BorderRadius.circular(15)),
                        ),

                        appSizeBox(width: 20),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Wed, Apr 28 • 5:30 PM" , style: appTextStyle(fontType: FontType.medium500 , textColor: AppColor.primaryColor , fontSize: 14),),

                              Text(
                                  "Jo Malone London’s Mother’s Day Presents",
                                  style: appTextStyle(fontType: FontType.semiBold , textColor: AppColor.black , fontSize: 16),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                              ),

                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.location , fit: BoxFit.fill,height: 20,color: AppColor.textGray,),
                                  appSizeBox(width: 5),
                                  Text(
                                    "Radius Gallery • Santa Cruz, CA",
                                    style: appTextStyle(fontType: FontType.medium500 , textColor: AppColor.textGray , fontSize: 14),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
          },),
        ),
      ),
    );
  }
}
