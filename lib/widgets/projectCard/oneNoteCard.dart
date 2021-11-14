import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';

import 'myProjectCard.dart';

class OneNoteCard extends StatelessWidget {
  final String saveName;
  final String description;

  OneNoteCard({
    required this.saveName,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "OneNote",
      saveName: saveName,
      description: description,
      color1: HexColor("#ca64ea"), //light
      color2: HexColor("#7719aa"), //dark
      asset: 'Assets/projectLogo/oneNoteLogo.png',
      onTap: () {
        print("OneNote");
      },
    );
  }
}
