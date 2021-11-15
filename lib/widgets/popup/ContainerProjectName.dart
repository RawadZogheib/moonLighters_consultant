
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'PopupProjectName.dart';


class ContainerProjectName extends StatefulWidget {
  const ContainerProjectName({Key? key}) : super(key: key);

  @override
  _ContainerProjectNameState createState() => _ContainerProjectNameState();
}

class _ContainerProjectNameState extends State<ContainerProjectName> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 31.6.h, //300
        width: 44.1.w, //400
        child: ListView(
            padding: EdgeInsets.all(8.0),
            children: [
              PopupProjectName(),
            ]
        ),
      ),
    );
  }
}
