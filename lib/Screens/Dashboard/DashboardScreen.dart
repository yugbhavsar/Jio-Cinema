import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Screens/Dashboard/DashboardWidgets.dart';
import 'package:jiocinema_clone/Screens/SideDrawer/bloc/side_drawer_bloc.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          leadingIcon: AppImages.dbMenu,
          isCustomTitleWidget: true,
          isTitleCenter: true,
          customTitle: dashboardTitleBar(),
          isHaveSuffixAction: true,
          actions: [AppImages.dbNotification],
          leadingIconOnTap: () {
            var state = context.read<SideDrawerBloc>().sideMenuKey.currentState;
            if (state?.isOpened ?? false) {
              context.read<SideDrawerBloc>().sideMenuKey.currentState?.closeSideMenu();
            }else{
              context.read<SideDrawerBloc>().sideMenuKey.currentState?.openSideMenu();
            }
          }),
      body: SafeArea(
        child: Column(
          children: [

            dashboardSearchFilterSection(context, searchController),

            appSizeBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    titleWithSeeAll(title: "Upcoming Events", btnName: "see all", onTap: (){
                        context.read<ThemeStyleCubit>().changeNavColor(barColor: Colors.white);
                        Navigator.pushNamed(context, RouteName.eventListScreen);
                    }),

                    appSizeBox(height: 10),

                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) {
                          return upcomingEventCard(context,() {
                            BlocProvider.of<ThemeStyleCubit>(context).changeNavColor(barColor: Colors.transparent);
                            Navigator.pushNamed(context, RouteName.eventDetailScreen);
                          },index);
                        },),
                      ),
                    ),

                    appSizeBox(height: 25),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15) , color: AppColor.secondaryColor.withOpacity(0.3)),
                      child: Stack(
                        children: [
                            Container(
                              margin : const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Invite your friends" , style: appTextStyle(fontType: FontType.semiBold , fontSize: 20 , textColor: AppColor.black),),

                                  appSizeBox(height: 10),

                                  Text("Get 20 for ticket" , style: appTextStyle(fontType: FontType.medium500 , fontSize: 18 , textColor: AppColor.black),),

                                  appSizeBox(height: 10),

                                  appNormalButton(title: "INVITE",backgroundColor: AppColor.secondaryColor)
                                ],
                              ),
                            ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(AppImages.dbOfferCard1 , fit: BoxFit.fitWidth,height: 160,)
                            ],
                          )
                        ],
                      ),
                    ),

                    appSizeBox(height: 20),

                    titleWithSeeAll(title: "Nearby You", btnName: "see all", onTap: (){

                    }),

                    appSizeBox(height: 10),

                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) {
                          return upcomingEventCard(context,() {

                          },index);
                        },),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

