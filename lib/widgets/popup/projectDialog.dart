import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProjectDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        height: 27.3.h,//300
        width: 70.8.w,//500
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [

          ],
        ),
      ),
    );
  }
}