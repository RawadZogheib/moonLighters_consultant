import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart'  as globals;
import 'package:mn_consultant/widgets/popup/ContainerApplication.dart';

class submitButton extends StatelessWidget {

  var submitBtnText;
  submitButton({required this.submitBtnText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 115,
            height: 40,
            decoration: BoxDecoration(
                color: globals.blue,
                borderRadius: BorderRadius.all(Radius.circular(14)),
                border: Border.all(color: globals.blue, width: 4)),
            child: Center(
              child: Text(
                submitBtnText,
                style: TextStyle(fontSize: 14 , color: globals.blue_1),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        //_launchApp();
        showDialog(
            context: context,
            builder: (BuildContext context) => ContainerApplication());
      },
    );
  }
}

