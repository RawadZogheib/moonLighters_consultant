import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:process_run/shell.dart';
import 'package:mn_consultant/widgets/projectCard/myProjectCard.dart';
var shell = Shell();
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
      dbType:"2",
      saveName: saveName,
      description: description,
      color1: HexColor("#33c481"), //light
      color2: HexColor("#185c37"), //dark
      asset: 'Assets/projectLogo/excelLogo.png',
      onTap: () async {
        print("Excel");
        if (Platform.isWindows) {
          await shell.run('''type nul > ./projects/${globals.contrat_Id}/${globals.projectName}.xlsx''');
          await shell.run('''start ./projects/${globals.contrat_Id}/${globals.projectName}.xlsx''');
        }
    else if (Platform.isMacOS || Platform.isLinux) {
          // Excel Documents
          await shell.run('''touch ./projects/${globals.contrat_Id}/${globals.projectName}.xlsx''');
          await shell.run('''open ./projects/${globals.contrat_Id}/${globals.projectName}.xlsx''');
        }
      },
    );
  }
}
