import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;

class myCode extends StatelessWidget {
  var onChange;
  var keybType;
  var textInputAction;

  myCode(
      {
        this.keybType,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
      maxLength: 6,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: onChange,
      textAlign: TextAlign.left,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "Enter the Code",
        hintStyle: TextStyle(fontSize: 14.0, color: globals.blue_1),
        filled: true,
        fillColor: globals.blue,
        alignLabelWithHint: true,
        labelStyle: TextStyle(fontSize: 14.0,color: globals.blue_1),
        border: InputBorder.none,
      ),
      keyboardType: this.keybType,
    ),
    );
  }
}