import 'package:flutter/material.dart';
import 'package:soilmaster/constants/colors.dart';

ThemeData whitetheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  fontFamily: 'Go',
  buttonTheme: ButtonThemeData(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), side: BorderSide.none),
      buttonColor: kPrimaryColor.withOpacity(0.3),
      minWidth: 150),
  scaffoldBackgroundColor: kScaffold,
  appBarTheme: const AppBarTheme(
    backgroundColor: kWhiteColor,
    elevation: 0,
    centerTitle: false,
  ),
  cardTheme: const CardTheme(shadowColor: kPrimaryColor, elevation: 10),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontFamily: 'Go', fontSize: 15, color: Colors.white)),
          foregroundColor: MaterialStateProperty.all<Color>(kWhiteColor),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          elevation: MaterialStateProperty.all<double>(15),
          shadowColor: MaterialStateProperty.all<Color>(kPrimaryColor))),
);
