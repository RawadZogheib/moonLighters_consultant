import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';

import 'myProjectCard.dart';

class ExcelCard extends StatelessWidget {
  final String saveName;
  final String description;

  ExcelCard({
    required this.saveName,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "Excel",
      saveName: saveName,
      description: description,
      color1: HexColor("#33c481"), //light
      color2: HexColor("#185c37"), //dark
      asset: 'Assets/projectLogo/excelLogo.png',
      onTap: () {
        print("Excel");
      },
    );
  }
}
