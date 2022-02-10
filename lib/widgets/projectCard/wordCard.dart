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

          var path = File("./projects/${globals.contrat_Id}/${globals.project_name}.docx");
          if ((await path.exists())) {
            await shell.run('''start ./projects/${globals.contrat_Id}/${saveName}.docx''');
          }else{
            // Word Documents
            await shell.run('''type nul > ./projects/${globals.contrat_Id}/${globals.project_name}.docx''');
            await shell.run('''start ./projects/${globals.contrat_Id}/${globals.project_name}.docx''');
          }

        }
        else if (Platform.isMacOS || Platform.isLinux) {
          // Word Documents
          await shell.run('''touch ./projects/${globals.contrat_Id}/${globals.project_name}.docx''');
          await shell.run('''open ./projects/${globals.contrat_Id}/${globals.project_name}.docx''');
          await shell.run(
              '''mdls ./projects/${globals.contrat_Id}/${globals.project_name}.docx -name kMDItemLastUsedDate''');
        }
      },
    );
  }
}
