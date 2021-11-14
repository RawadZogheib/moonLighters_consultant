import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';

import 'myProjectCard.dart';

class PublisherCard extends StatelessWidget {
  final String saveName;
  final String description;

  PublisherCard({
    required this.saveName,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "Publisher",
      saveName: saveName,
      description: description,
      color1: HexColor("#37c6d0"), //light
      color2: HexColor("#038387"), //dark
      asset: 'Assets/projectLogo/publisherLogo.png',
      onTap: () {
        print("Publisher");
      },
    );
  }
}
