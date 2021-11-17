import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:process_run/shell.dart';
import 'myProjectCard.dart';
var shell = Shell();

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
      onTap: () async {
        print("PowerPoint");
        if (Platform.isWindows) {
          await shell.run('''type nul > ${globals.projectName}.pptx''');
          await shell.run('''start ${globals.projectName}.pptx''');
        }
    else if (Platform.isMacOS || Platform.isLinux) {
          await shell.run('''touch ${globals.projectName}.pptx''');
          await shell.run('''open ${globals.projectName}.pptx''');
        }
      },
    );
  }
}
