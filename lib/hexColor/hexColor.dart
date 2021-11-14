import 'package:flutter/material.dart';

class HexColor extends Color{   //we can use it anytime we want , and in any project we want
  static int _getColorFromHex(String hexColor){
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length == 6){
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

}

//How to use:
/*

  Color color1 = HexColor("b74093");
  Color color2 = HexColor("#b74093");
  Color color1 = HexColor("#88b74093"); // if u want to use ARGB form

 */