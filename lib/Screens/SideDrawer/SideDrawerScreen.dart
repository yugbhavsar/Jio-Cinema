import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Screens/Dashboard/DashboardScreen.dart';
import 'package:jiocinema_clone/Screens/SideDrawer/bloc/side_drawer_bloc.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';


class SideDrawerScreen extends StatelessWidget {
  const SideDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: context.read<SideDrawerBloc>().sideMenuKey,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25),
          child: buildMenu(context)
      ),
      type: SideMenuType.shrinkNSlide,
      // maxMenuWidth: MediaQuery.of(context).size.width - 50,
      background: AppColor.white,
      closeIcon: null,
      child: DashboardScreen(),
    );
  }
}



Widget buildMenu(BuildContext context) {
  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                  color: AppColor.gray.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:Radius.circular(15))
              ),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: MediaQuery.of(context).size.height*0.6,
              decoration: BoxDecoration(
                color: AppColor.gray.withOpacity(0.4),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:Radius.circular(15))
              ),
            )
          ],
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 2.0,
              shadowColor: AppColor.black,
              child: Image.asset(AppImages.profile2 , fit: BoxFit.fitHeight ,height: 60,),
            ),

            appSizeBox(height: 10),

            Text("Ashfak Sayem" , style: appTextStyle(fontType: FontType.bold, fontSize: 25 ,textColor: AppColor.black),),

            appSizeBox(height: 40),

            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(context.read<SideDrawerBloc>().drawerIcon.length, (index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(context.read<SideDrawerBloc>().drawerIcon[index] , fit: BoxFit.fill,height: 25,),
                            appSizeBox(width: 20),
                            Text(context.read<SideDrawerBloc>().drawerTitle[index] , style: appTextStyle(fontType: FontType.semiBold , fontSize: 18 , textColor: AppColor.black),)
                          ],
                        ),
                      );
                    }),
                  ),
                )
            ),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColor.secondaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(AppImages.menuPremium , fit: BoxFit.fill,height: 25,),
                        appSizeBox(width: 10),
                        Text("Upgrade Pro",style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.secondaryColor),)
                      ],
                    ),
                  ),
                ),

                Expanded(child: appSizeBox())
              ],
            ),

            appSizeBox(height: 40),
          ],
        ),
      ]
    ),
  );
}
