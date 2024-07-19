import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiocinema_clone/Screens/EventDetail/bloc/event_filter_bloc.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';


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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            appSizeBox(height: 20),

            Text("Filter" , style: appTextStyle(fontSize: 26 , fontType: FontType.medium500 , textColor: AppColor.black),),

            appSizeBox(height: 20),

            BlocBuilder<EventFilterBloc , EventFilterState>(builder: (context, state) {
              int selectedCategories = 0;
              if (state is EventFilterInitial) {
                selectedCategories = state.selectedCategories;
              }else if (state is EventFilterCategoriesChangeState) {
                selectedCategories = state.selectedIndex;
              }
              return filterCategoriesSelection(context , selectedCategories);
            },),

            appSizeBox(height: 20),

            Text("Time & Date" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.black),),

            appSizeBox(height: 20),


            BlocBuilder<EventFilterBloc , EventFilterState>(
              builder: (context, state) {
                var selectedIndex = 0;
                if (state is EventFilterInitial) {
                  selectedIndex = 1;
                }else if (state is EventFilterChangeDateTimeSelection) {
                  selectedIndex = state.selectedIndex;
                }
                return filterDateTimeWise(context , selectedIndex);
            },),


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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select price range" , style: appTextStyle(fontSize: 18 , fontType: FontType.bold , textColor: AppColor.black),),

                Text("\$20-\$120" , style: appTextStyle(fontSize: 16 , fontType: FontType.medium , textColor: AppColor.primaryColor),),
              ],
            ),

            appSizeBox(height: 20),

            RangeSlider(
              max: 100,
              min: 0,
              activeColor: AppColor.primaryColor,
              inactiveColor: AppColor.gray,
              values: const RangeValues(40, 60),
              onChanged: (value) {

              },
            ),

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
        ),
      ),
    );
  }
}



Widget filterCategoriesSelection(BuildContext context , int selectedIndex) {

  final List<String> filterOptionIcon = [AppImages.sportsIcon , AppImages.musicIcon, AppImages.foodIcon , AppImages.artIcon];
  final List<String> filterOptionName = ["Sports" , "Music", "Food" , "Art"];

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


Widget filterDateTimeWise(BuildContext context , int selectedIndex) {

  final List<String> timeDateOption = ["Today" , "Tomorrow", "This week" , "Chose From Calender"];

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