import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';


SizedBox customOtpTextField({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
  FocusNode? currentNode,
  FocusNode? nextNode,
  bool isLastField = false
}) {

  return SizedBox(
    width: 70,
    height: 70,
    child: TextField(
      textAlign: TextAlign.center,
      maxLength: 1,
      keyboardType: TextInputType.number,
      focusNode: currentNode,
      controller: controller,
      style: const TextStyle(
          fontFamily: "OpenSans" ,
          fontSize: 22 ,
          fontWeight:FontWeight.bold
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        counterText: "",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10) ,
            gapPadding: 5 ,
            borderSide: const BorderSide(width: 1,color: AppColor.borderGray,strokeAlign: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10) ,
            gapPadding: 5 ,
            borderSide: const BorderSide(width: 2,color: AppColor.primaryColor,strokeAlign: 1)
        ),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: (value) {
        if (isLastField) {
          FocusScope.of(context).unfocus();
        }else if (value.isNotEmpty){
          FocusScope.of(context).requestFocus(nextNode);
        }else {
          FocusScope.of(context).unfocus();
        }
      },
    ),
  );
}


TextField customTextField({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText ,
  bool showPrefixIcon = true,
  String prefixIcon = "",
  bool showSuffixIcon = false,
  String suffixIcon = ""
}) {

  return TextField(
    controller: controller,
    style: const TextStyle(
      fontFamily: "OpenSans" ,
      fontSize: 16 ,
      fontWeight:FontWeight.bold
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
        suffixIcon: showSuffixIcon ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: SvgPicture.asset(suffixIcon ,fit: BoxFit.fill,)
        ):null,
        prefixIcon: showPrefixIcon ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: SvgPicture.asset(prefixIcon ,fit: BoxFit.fill,)
        ):null,
        hintText: hintText ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10) ,
            gapPadding: 5 ,
            borderSide: const BorderSide(width: 1,color: AppColor.borderGray,strokeAlign: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10) ,
            gapPadding: 5 ,
            borderSide: const BorderSide(width: 2,color: AppColor.primaryColor,strokeAlign: 1)
        ),
    ),
    onTapOutside: (event) {
      FocusScope.of(context).unfocus();
    },
  );
}


ElevatedButton customButton({ required String buttonName, required VoidCallback onTap ,}) {

  return ElevatedButton(
    onPressed: onTap ,
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(child: Text(buttonName,style: appTextStyle(fontSize: 20 , fontType: FontType.bold , textColor: Colors.white), )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
              children: [
                appSizeBox(height: 0,width: 0),
                SvgPicture.asset(AppImages.lgContinueArrow , fit: BoxFit.fill,height: 40,)
              ],
            )
          ],
        )

        
    )
  );
}

ElevatedButton appNormalButton({ required String title , Color backgroundColor = AppColor.primaryColor , double borderRadius = 8 , Color fontColor = Colors.white}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))
    ),
    onPressed: (){

    },
    child: Text(title ,style: appTextStyle(fontType: FontType.bold , fontSize: 18 , textColor: fontColor),),
  );
}


AppBar customAppBar({
  String title = "" ,
  Color titleColor = AppColor.black ,
  bool isTitleCenter = false ,
  String leadingIcon = "" ,
  Color leadingIconColor = Colors.transparent,
  required VoidCallback leadingIconOnTap ,
  bool isHaveSuffixAction = false,
  List<String>? actions,
  bool isCustomTitleWidget = false,
  Widget? customTitle
} ) {
  return AppBar(
    title: isCustomTitleWidget ? customTitle:Text(title),
    centerTitle: isTitleCenter,
    titleTextStyle: appTextStyle(fontSize: 22 , fontType: FontType.bold, textColor: titleColor),
    leading: Container(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
        icon: SvgPicture.asset(leadingIcon , fit: BoxFit.fill,height: 30,width: 30,color: leadingIconColor == Colors.transparent ? null:leadingIconColor),
        onPressed: leadingIconOnTap
      ),
    ),
    actions: isHaveSuffixAction ? appBarAction(actions ?? []): [],
  );
}

List<Widget> appBarAction(List<String> iconName) {

  return List.generate(iconName.length, (index) {
    return  Container(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
          icon: SvgPicture.asset(iconName[index] , fit: BoxFit.fill,height: 30,width: 30,),
          onPressed: (){}
      ),
    );
  },);
}