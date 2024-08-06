import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';

import '../bloc/event_filter_bloc.dart';


class FilterCategoriesSelection extends StatelessWidget {

  final List<String> filterOptionIcon = [AppImages.sportsIcon , AppImages.musicIcon, AppImages.foodIcon , AppImages.artIcon];
  final List<String> filterOptionName = ["Sports" , "Music", "Food" , "Art"];
  int selectedIndex;

  FilterCategoriesSelection({super.key , required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(filterOptionIcon.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    context.read<EventFilterBloc>().add(EventFilterChangeCategories(currentSelection: index));
                  },
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    shadowColor: (index == selectedIndex ) ? AppColor.primaryColor:AppColor.textGray,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: (index == selectedIndex) ? AppColor.primaryColor:AppColor.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColor.gray , width:(index == selectedIndex) ? 0:1),
                      ),
                      child: Image.asset(filterOptionIcon[index], fit: BoxFit.fitWidth, height: 30,color: (index == selectedIndex) ? AppColor.white:AppColor.textGray,),
                    ),
                  ),
                ),

                appSizeBox(height: 5),

                Text(filterOptionName[index],style: appTextStyle(textColor: AppColor.black,fontType: FontType.semiBold , fontSize: 16),)
              ],
            ),
          );
        }),
      ),
    );
  }
}


class FilterDateTimeWise  extends StatelessWidget {

  final List<String> timeDateOption = ["Today" , "Tomorrow", "This week" , "Chose From Calender"];
  int selectedIndex;

  FilterDateTimeWise({super.key,required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(timeDateOption.length, (index) {
        return GestureDetector(
          onTap: (){
            context.read<EventFilterBloc>().add(EventFilterDateTimeChange(currentSelection: index));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            margin: const EdgeInsets.only(right: 15,bottom: 15),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: (index == selectedIndex) ? AppColor.primaryColor:AppColor.white,
                border: Border.all(
                  color: (index == selectedIndex) ? AppColor.primaryColor:AppColor.gray,
                  width: (index == selectedIndex) ? 0:1,
                )
            ),
            child: (index == 3) ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppImages.filterCalendar ,fit: BoxFit.fill,height: 24,),
                appSizeBox(width: 20),
                Text(timeDateOption[index] , style: appTextStyle(fontSize: 16 , fontType: FontType.semiBold , textColor: (index == selectedIndex) ? AppColor.white:AppColor.textGray),),
                appSizeBox(width: 20),
                SvgPicture.asset(AppImages.filterForward ,fit: BoxFit.fitWidth,height: 24,),
              ],
            ):Text(timeDateOption[index] , style: appTextStyle(fontSize: 16 , fontType: FontType.semiBold , textColor: (index == selectedIndex) ? AppColor.white:AppColor.textGray),),
          ),
        );
      }),
    );
  }
}

class SelectPriceRange extends StatelessWidget {

  double minValue;
  double maxValue;

  SelectPriceRange({super.key ,required this.minValue , required this.maxValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select price range" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.black),),

            Text("\$${minValue.toInt()}-\$${maxValue.toInt()}" , style: appTextStyle(fontSize: 16 , fontType: FontType.medium , textColor: AppColor.primaryColor),),
          ],
        ),

        appSizeBox(height: 20),

        RangeSlider(
          max: 1000,
          min: 0,
          activeColor: AppColor.primaryColor,
          inactiveColor: AppColor.gray,
          values: RangeValues(minValue,maxValue),
          onChanged: (value) {
            context.read<EventFilterBloc>().add(EventFilterPriceRangeChangeEvent(minValue: value.start, maxValue: value.end));
          },
        ),
      ],
    );
  }
}
