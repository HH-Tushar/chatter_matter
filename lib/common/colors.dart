import 'dart:ui';

import 'package:flutter/widgets.dart';

const openDrawerBg = Color(0xffFBEFFF);
const customWhite = Color(0xffFFFFFF);
const customBlack = Color(0xff000000);
const customGrey = Color(0xff616161);
const customLightGrey = Color(0xffBDBDBD);
const primaryColor = Color(0xffA65FC2);
const primaryContainer = Color(0xffD6A9E6);
const customYellow = Color(0xffFFFAB9);
const customBlue = Color(0xff155DFC);
const customPurple = Color(0xff4A136A);
const customRed = Color(0xffE7000B);
const customGreen = Color(0xff008236);
const customGreenContainer = Color(0xffDCFCE7);

//dedicated tileColor
const customLightBlue = Color(0xff95ADF3); //done
const customLightOrange = Color(0xffFFB29C); //done
const customLightTeal = Color(0xff97CCC4); //done
const customLightBrawn = Color(0xffD6A6B4); //done
const customLightLavender = Color(0xffE1B9E6); //done
const customLightOlive = Color(0xffA8B8A0); //done
const customGreyOlive = Color(0xffA0B8C3); //done
const customLightPink = Color(0xffF1A7D7);
const customLightYellow = Color(0xffE2D5A3);
const customLightPurple = Color(0xffC18DD9);
const vipGradient = [Color(0xffFFFAB9), Color(0xffD6A9E6)];

const tileColors = [
  TileColor(color: customLightBlue, colorName: "customLightBlue"),
  TileColor(color: customLightOrange, colorName: "customLightOrange"),
  TileColor(color: customLightTeal, colorName: "customLightTeal"),
  TileColor(color: customLightBrawn, colorName: "customLightBrawn"),
  TileColor(color: customLightLavender, colorName: "customLightLavender"),
  TileColor(color: customLightOlive, colorName: "customLightOlive"),
  TileColor(color: customGreyOlive, colorName: "customGreyOlive"),
  TileColor(color: customLightPink, colorName: "customLightPink"),
  TileColor(color: customLightYellow, colorName: "customLightYellow"),
  TileColor(color: customLightPurple, colorName: "customLightPurple"),


];

class TileColor {
  final Color color;
  final String colorName;
  const TileColor({required this.color, required this.colorName});
}

final customShadow = [
  BoxShadow(
    offset: Offset(0, 4),
    color: customLightGrey,
    blurRadius: 4,
    spreadRadius: -6,
  ),
  BoxShadow(
    offset: Offset(2, 8),
    color: customLightGrey,
    blurRadius: 15,
    spreadRadius: -3,
  ),
];
