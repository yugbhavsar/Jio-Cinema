import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/theme_style_cubit.dart';
import 'package:jiocinema_clone/Screens/EventDetail/EventFilterScreen.dart';
import 'package:jiocinema_clone/Screens/EventDetail/bloc/event_filter_bloc.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:jiocinema_clone/Utilities/Routing.dart';
import 'package:jiocinema_clone/Utilities/Utilites.dart';


class SearchEventScreen extends StatefulWidget {
  const SearchEventScreen({super.key});

  @override
  State<SearchEventScreen> createState() => _SearchEventScreenState();
}

class _SearchEventScreenState extends State<SearchEventScreen> {

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          leadingIconColor: AppColor.black,
          title: "Search",
          titleColor: AppColor.black,
          leadingIcon: AppImages.back,
          leadingIconOnTap: (){
            Navigator.pop(context);
            context.read<ThemeStyleCubit>().changeNavColor(barColor: AppColor.primaryColor);
          },
          actionOnTap: (index){

          }
      ),
      body: SafeArea(
        child: Padding(
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
                    color: AppColor.primaryColor,
                  ),
                  appSizeBox(width: 10),
                  Container(
                    width: 2,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.gray.withOpacity(0.8)),
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
                          fontSize: 16,
                          fontWeight: FontWeight.w700,),
                      controller: controller,
                    ),
                  ),

                  appSizeBox(width: 20),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          useRootNavigator: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => GestureDetector(
                            onVerticalDragUpdate: (details) { },
                            child: BlocProvider(
                              create: (context) => EventFilterBloc(),
                              child: EventFilterScreen(),
                            ),
                          )
                      );
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
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
                  ),
                  appSizeBox(height: 20),
                ],
              ),

              appSizeBox(height: 20),
              Expanded(
                child: Container(
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
                                  width: 80,
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
            ],
          ),
        ),
      ),
    );
  }
}
