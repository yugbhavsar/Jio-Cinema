import 'package:flutter/material.dart';

class AppColor {

  static const  Color primaryColor =  Color(0xFF5669FF);
  static const  Color primaryLightColor =  Color(0xFF676DF4);
  static const Color secondaryColor =  Color(0xFF00F8FF);
  static const Color red = Color(0xFFF0635A);
  static const Color green = Color(0xFF39B54A);
  static const Color orange = Color(0xFFF59762);
  static const Color yellow = Color(0xFFFDC400);
  static const Color gray = Color(0xFFE6E6E6);
  static const Color borderGray = Color(0xFFE4DFDF);
  static const Color darkTextColor = Color(0xFF37364A);
  static const Color black = Color(0xFF120D26);
  static const Color textGray = Color(0xFF9D9898);
}


enum FontType {
  bold,
  semiBold,
  medium,
  medium500,
  normal,
}

FontWeight getFontWeight(FontType fontType) {
  switch (fontType) {
    case FontType.bold:
      return FontWeight.bold;
    case FontType.semiBold:
      return FontWeight.w700;
    case FontType.medium:
      return FontWeight.w600;
    case FontType.medium500:
      return FontWeight.w500;
    case FontType.normal:
      return FontWeight.normal;
  }
}

TextStyle appTextStyle({Color textColor = AppColor.primaryColor , double fontSize = 18, FontType fontType = FontType.normal}) {
  return TextStyle(
    color: textColor,
    fontSize: fontSize,
    fontWeight: getFontWeight(fontType),
    fontFamily: "OpenSans",
  );
}

SizedBox appSizeBox({double height = 10 , double width = 0 }) {
  return SizedBox(height: height,width: width,);
}
