import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';

import 'myProjectCard.dart';

class PowerPointCard extends StatelessWidget {
  final String saveName;
  final String description;

  PowerPointCard({
    required this.saveName,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "PowerPoint",
      saveName: saveName,
      description: description,
      color1: HexColor("#ff8f6b"), //light
      color2: HexColor("#bc3618"), //dark
      asset: 'Assets/projectLogo/powerPointLogo.png',
      onTap: () {
        print("PowerPoint");
      },
    );
  }
}
