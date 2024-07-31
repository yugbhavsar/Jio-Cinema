import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiocinema_clone/Cubit/loader_view_cubit.dart';
import 'package:jiocinema_clone/Utilities/AppStyling.dart';
import 'package:jiocinema_clone/Utilities/Constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class AppScaffold extends StatelessWidget {

  AppScaffold({super.key, required this.appBar ,required this.child });

  AppBar appBar;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaderViewCubit , LoaderViewState>(builder: (context, state)
    {
      return Stack(
          children: [
            Scaffold(
                appBar: appBar,
                body: child
            ),

            state.isLoading ? Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColor.textGray.withOpacity(0.3),
              child: LoadingAnimationWidget.dotsTriangle(color: AppColor.primaryColor, size: 50),
            ):appSizeBox(),

            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              height: state.dialogueBoxHeight,
              curve: Curves.elasticOut,
              alignment: Alignment(0,state.dialogueBoxPosition),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.primaryColor),
                child: Text("Dialogue Box Message Here", style: appTextStyle(fontType: FontType.semiBold , fontSize: 20 , textColor: AppColor.white),),
              ),
            ),
          ]
      );
    });
  }
}



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


ElevatedButton customButton({
  required String buttonName,
  Color backgroundColor = AppColor.primaryColor,
  Color textColor = Colors.white,
  double textSize = 20,
  Color borderColor = AppColor.primaryColor,
  double buttonHeight = 70,
  double roundBorder = 12,
  bool isSuffixIconVisible = true ,
  bool isPrefixIconVisible = false ,
  String prefixIcon = "",
  required VoidCallback onTap,
}) {
  return ElevatedButton(
    onPressed: onTap ,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(roundBorder), side: BorderSide(width: 2 , color:borderColor)),
    ),
    child: SizedBox(
        height: buttonHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              isPrefixIconVisible ? prefixIcon:AppImages.editProfile,
              fit: BoxFit.fill,
              // height: isPrefixIconVisible ? 25:0,
            ),

            appSizeBox(width: isPrefixIconVisible ? 10:0),

            Center(child: Text(buttonName,style: appTextStyle(fontSize: textSize , fontType: FontType.bold , textColor: textColor ), )),

            SvgPicture.asset(
              AppImages.lgContinueArrow,
              fit: BoxFit.fill,
              height: isSuffixIconVisible ? 40:0,
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
  required Function(int) actionOnTap,
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
    actions: isHaveSuffixAction ? appBarAction(actions ?? [],(p0) => actionOnTap!(p0),): [],
  );
}

List<Widget> appBarAction(List<String> iconName , Function(int) onTap) {

  return List.generate(iconName.length, (index) {
    return  Container(
      padding: const EdgeInsets.only(right: 10),
      child: IconButton(
          icon: SvgPicture.asset(iconName[index] , fit: BoxFit.fill,height: 30,width: 30,),
          onPressed: (){
            onTap(index);
          }
      ),
    );
  },);
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}