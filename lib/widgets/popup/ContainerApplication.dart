
import 'package:flutter/material.dart';
import 'package:mn_consultant/widgets/projectCard/accessCard.dart';
import 'package:mn_consultant/widgets/projectCard/excelCard.dart';
import 'package:mn_consultant/widgets/projectCard/oneNoteCard.dart';
import 'package:mn_consultant/widgets/projectCard/powerPointCard.dart';
import 'package:mn_consultant/widgets/projectCard/publisherCard.dart';
import 'package:mn_consultant/widgets/projectCard/wordCard.dart';
import 'package:sizer/sizer.dart';

import 'errorAlertDialog.dart';
final children = <Widget>[];
class ContainerApplication extends StatefulWidget {
  const ContainerApplication({Key? key}) : super(key: key);

  @override
  _ContainerApplicationState createState() => _ContainerApplicationState();
}

class _ContainerApplicationState extends State<ContainerApplication> {

  List<String> type = [
    "asfasd",
    "Word",
    "Word",
    "Excel",
    "Excel",
    "PowerPoint",
    "PowerPoint",
    "Access",
    "Access",
    "OneNote",
    "OneNote",
    "Publisher",
    "Publisher"
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 26.6.h, //300
        width: 130.1.w, //400
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              WordCard(saveName: "", description: ""),
              ExcelCard(saveName: "", description: ""),
              PowerPointCard(saveName: "", description: ""),
              AccessCard(saveName: "", description: ""),
              OneNoteCard(saveName: "", description: ""),
              PublisherCard(saveName: "", description: ""),
          ],
          )
    ),

    );

  }

}