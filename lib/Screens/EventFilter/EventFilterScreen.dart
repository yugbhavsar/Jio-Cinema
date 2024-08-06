import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';

import 'Widgets/EventFilterWidgets.dart';
import 'bloc/event_filter_bloc.dart';


class EventFilterScreen extends StatelessWidget {
  EventFilterScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            BlocBuilder<EventFilterBloc , EventFilterState>(builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  appSizeBox(height: 20),

                  Text("Filter" , style: appTextStyle(fontSize: 26 , fontType: FontType.medium500 , textColor: AppColor.black),),

                  appSizeBox(height: 20),


                  FilterCategoriesSelection(selectedIndex: state.selectedCategories),

                  appSizeBox(height: 20),

                  Text("Time & Date" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.black),),

                  appSizeBox(height: 20),


                  FilterDateTimeWise(selectedIndex: state.selectedDateTimeIndex),

                  appSizeBox(height: 20),

                  Text("Location" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.black),),

                  appSizeBox(height: 20),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.gray,width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        appSizeBox(width: 20),

                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primaryColor
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.white
                              ),
                              child: SvgPicture.asset(AppImages.filterLocation ,fit: BoxFit.fill,height: 15,)
                          ),
                        ),
                        appSizeBox(width: 10),
                        Text("New York, USA" , style: appTextStyle(fontSize: 18 , fontType: FontType.medium500 , textColor: Colors.black),),

                        Expanded(child: appSizeBox()),
                        SvgPicture.asset(AppImages.filterForward ,fit: BoxFit.fitWidth,height: 24,),

                        appSizeBox(width: 20),
                      ],
                    ),
                  ),

                  appSizeBox(height: 20),

                  SelectPriceRange(minValue: state.minPriceValue, maxValue: state.maxPriceValue),

                  appSizeBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width/2 - 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.gray , width: 1 ),
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(child: Text("RESET" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.black),)),
                        ),
                      ),

                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width/2 - 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.primaryColor
                          ),
                          child: Center(child: Text("APPLY" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.white),)),
                        ),
                      )
                    ],
                  )
                ],
              );
            },),
          ],
        )
      ),
    );
  }
}


