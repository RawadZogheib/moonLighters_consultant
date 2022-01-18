import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:process_run/shell.dart';
import 'package:mn_consultant/widgets/projectCard/myProjectCard.dart';
var shell = Shell();

class WordCard extends StatelessWidget {
  final String saveName;
  final String description;

  WordCard({
    required this.saveName,
    required this.description});



  @override
  Widget build(BuildContext context) {
    return MySavesCard(
      type: "Word",
      dbType:"1",
      saveName: saveName,
      description: description,
      color1: HexColor("#41a5ee"), //light
      color2: HexColor("#103f91"), //dark
      asset: 'Assets/projectLogo/wordLogo.png',
      onTap: () async {
        print("word");
        if (Platform.isWindows) {
          // Word Documents
          await shell.run('''type nul > ./projects/${globals.contrat_Id}/${globals.projectName}.docx''');
          await shell.run('''start  ./projects/${globals.contrat_Id}/${globals.projectName}.docx''');
          await shell.run('''dir  ./projects/${globals.contrat_Id}/${globals.projectName} /a''');
        }
        else if (Platform.isMacOS || Platform.isLinux) {
          // Word Documents
          await shell.run('''touch  ./projects/${globals.contrat_Id}/${globals.projectName}.docx''');
          await shell.run('''open  ./projects/${globals.contrat_Id}/${globals.projectName}.docx''');
          await shell.run(
              '''mdls  ./projects/${globals.contrat_Id}/${globals.projectName}.docx -name kMDItemLastUsedDate''');
        }
      },
    );
  }
}
