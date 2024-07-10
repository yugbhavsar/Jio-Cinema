import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';


Widget dashboardTitleBar() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Current Location",
            style: appTextStyle(
                fontSize: 16,
                fontType: FontType.medium,
                textColor: Colors.white),
          ),
          appSizeBox(width: 5),
          SvgPicture.asset(AppImages.dbDropDown,
              fit: BoxFit.fitHeight, width: 15)
        ],
      ),
      Text(
        "New York, USA",
        style: appTextStyle(
            fontSize: 18, fontType: FontType.semiBold, textColor: Colors.white),
      ),
    ],
  );
}

Widget titleWithSeeAll({required String title  , required String btnName , required VoidCallback onTap }) {

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title , style: appTextStyle(fontSize: 22 , fontType: FontType.semiBold , textColor: AppColor.darkTextColor),),

        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(btnName , style: appTextStyle(fontSize: 18 , fontType: FontType.semiBold , textColor: AppColor.textGray),),
              appSizeBox(width: 3),
              SvgPicture.asset(AppImages.dbSeeAll ,fit: BoxFit.fill,height: 15,)
            ],
          ),
        )
      ],
    ),
  );

}

Widget dashboardSearchFilterSection(
    BuildContext context, TextEditingController controller) {
  return Stack(children: [
    Container(
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appSizeBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImages.dbSearch,
                  fit: BoxFit.fill,
                  height: 30,
                ),
                appSizeBox(width: 10),
                Container(
                  width: 2,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.gray.withOpacity(0.4)),
                ),
                appSizeBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: "Search....",
                      hintStyle: TextStyle(color: AppColor.textGray),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    controller: controller,
                  ),
                ),
                Expanded(child: appSizeBox()),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColor.primaryLightColor,
                      borderRadius: BorderRadius.circular(22)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.dbFilter,
                        fit: BoxFit.fill,
                        height: 25,
                      ),
                      appSizeBox(width: 5),
                      Text(
                        "Filters",
                        style: appTextStyle(
                            fontSize: 18,
                            fontType: FontType.medium,
                            textColor: Colors.white),
                      ),
                    ],
                  ),
                ),
                appSizeBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    ),
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(Constants.eventWiseFilter.length, (index) {
                return Row(
                  children: [
                    appSizeBox(width: index == 0 ? 20:0),
                    Container(
                      decoration: BoxDecoration(color: Constants.eventWiseFilterColor[index], borderRadius: BorderRadius.circular(22)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(Constants.eventWiseFilterIcon[index], fit: BoxFit.fill, height: 25,),
                              appSizeBox(width: 5),
                              Text(Constants.eventWiseFilter[index], style: appTextStyle(fontType: FontType.medium, textColor: Colors.white, fontSize: 18),)
                            ],
                          )
                      ),
                    ),
                    appSizeBox(width: 10),
                  ],
                );
              },
              ),
            ),
          )
        ],
      ),
    )
  ]);
}

Widget upcomingEventCard(BuildContext context , VoidCallback onTap) {
  return Card(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
          width: MediaQuery.of(context).size.width*0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Stack(
                  children:[
                    SvgPicture.asset(AppImages.dbEventCard ,height: MediaQuery.of(context).size.height*0.19,width: MediaQuery.of(context).size.width*0.7-20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
                          decoration: BoxDecoration(color: AppColor.orange.withOpacity(0.7),borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("10" ,style: appTextStyle(fontSize: 14 , fontType: FontType.bold , textColor: AppColor.red),),
                              Text("July" ,style: appTextStyle(fontSize: 14 , fontType: FontType.bold , textColor: AppColor.red),),
                            ],
                          ),
                        ),

                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(color: AppColor.orange.withOpacity(0.7),borderRadius: BorderRadius.circular(10)),
                            child: SvgPicture.asset(AppImages.dbSave , fit: BoxFit.fitHeight, height: 20)
                        )
                      ],
                    )
                  ]
              ),

              appSizeBox(height: 10),

              Text("International Band this or that" , maxLines: 1,overflow: TextOverflow.ellipsis,style: appTextStyle(fontSize: 20 , fontType: FontType.bold , textColor: AppColor.black),),

              appSizeBox(height: 5),

              Row(
                children: [
                  Image.asset(AppImages.groupImage ,fit: BoxFit.fitWidth,height: 30,),
                  appSizeBox(width: 10),
                  Text("+20 Going",style: appTextStyle(fontSize: 16 , fontType: FontType.bold , textColor: AppColor.primaryColor),),
                ],
              ),

              appSizeBox(height: 5),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.dbLocation ,fit: BoxFit.fitHeight,),
                  appSizeBox(width: 5),
                  Text("36 Guild Street London, UK ",style: appTextStyle(fontSize: 16 , fontType: FontType.bold , textColor: AppColor.textGray),),
                ],
              )
            ],
          )
      ),
    ),
  );
}