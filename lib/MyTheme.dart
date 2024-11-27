import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLightColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffffffff);
  static Color redColor = Color(0xffC91C22);
  static Color darkBlueColor = Color(0xff003E92);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blurColor = Color(0xff4482CF);
  static Color yellowClor = Color(0xffF2D352);
  static Color greyColor = Color(0xff4F5A69);
  static Color blackColor = Color(0xff3903030);
  static ThemeData ligthTheme=ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only
          (bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30))
      )
    ),
    textTheme:  TextTheme(titleLarge: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: whiteColor),
    titleMedium: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: whiteColor),
    titleSmall: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: whiteColor)
    ),
  );
}