
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContainerApplication extends StatefulWidget {
  const ContainerApplication({Key? key}) : super(key: key);

  @override
  _ContainerApplicationState createState() => _ContainerApplicationState();
}

class _ContainerApplicationState extends State<ContainerApplication> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 31.6.h, //300
        width: 40.1.w, //400
      ),
    );
  }
}
