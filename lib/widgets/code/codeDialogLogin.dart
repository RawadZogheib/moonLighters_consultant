import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/widgets/code/sixCodeLogin.dart';
import 'package:sizer/sizer.dart';

class codeDialogLogin extends StatefulWidget {
  const codeDialogLogin({Key? key}) : super(key: key);

  @override
  _codeDialogLoginState createState() => _codeDialogLoginState();
}

class _codeDialogLoginState extends State<codeDialogLogin> {
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
              sixCodeLogin(),
            ]
        ),
      ),
    );
  }
}