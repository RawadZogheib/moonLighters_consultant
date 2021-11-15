import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final double circularBorderRadius;
  final bool goHome;
  var onPress;

  ErrorAlertDialog({
    this.title = "Error",
    required this.message,
    this.circularBorderRadius = 8.0,
    this.bgColor = Colors.white,
    this.goHome = false,
    this.onPress,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onPress;
            if(goHome == true){
              Navigator.pushNamedAndRemoveUntil(context,'/Login', (route) => false);
            }},
          child: const Text('OK'),
        ),
      ],
    );
  }
}