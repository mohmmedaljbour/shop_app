import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

// ignore: non_constant_identifier_names
ThemeData darkTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: HexColor('333739'),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      selectedItemColor: defaultColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      backgroundColor: HexColor('333739'),
    ),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: HexColor("333739"),
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness:Brightness.light,
        )


    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),

    ),
  fontFamily: 'Janna'

);
ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      selectedItemColor: defaultColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    ),
    appBarTheme:  AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness:Brightness.dark,
        )


    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        )
    ),
    fontFamily: 'Janna',


);