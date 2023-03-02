import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class Themes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: lightBlue,
      secondary: lightBlue,
    ),
    iconTheme: const IconThemeData(color: black),
    buttonTheme: const ButtonThemeData(buttonColor: lightPurple),
    scaffoldBackgroundColor: white,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightSkyBlue,
      titleTextStyle: TextStyle(color: black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightSkyBlue,
      ),
      iconTheme: IconThemeData(color: black),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: white,),
    sliderTheme: const SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: MaterialStatePropertyAll(black),
      fillColor: MaterialStatePropertyAll(lightPurple),
    ),
    dialogBackgroundColor: darkBlue,
    toggleButtonsTheme: const ToggleButtonsThemeData(
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      fillColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: black, unselectedItemColor: Colors.white, ),
      dialogTheme: DialogTheme(
        backgroundColor: white,
        shadowColor: grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.sp),
          side: const BorderSide(width: 1, color: grey),
        ),
      )
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: darkBlue,
      secondary: darkBlue,
    ),
    iconTheme: const IconThemeData(color: white),
    buttonTheme: const ButtonThemeData(buttonColor: darkPurple,),
    scaffoldBackgroundColor: black,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightSkyBlue,
      titleTextStyle: TextStyle(color: white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: lightSkyBlue,
      ),
      iconTheme: IconThemeData(color: white),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: black),
    sliderTheme: const SliderThemeData(
      inactiveTickMarkColor: Colors.transparent,
      activeTickMarkColor: Colors.transparent,
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: MaterialStatePropertyAll(white),
      fillColor: MaterialStatePropertyAll(darkPurple),
    ),
    dialogBackgroundColor: lightBlue,
    toggleButtonsTheme: const ToggleButtonsThemeData(
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      fillColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: white, unselectedItemColor: black),
      dialogTheme: DialogTheme(
        backgroundColor: black,
        shadowColor: grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.sp),
          side: const BorderSide(width: 1, color: grey),
        ),
      )
  );
}
