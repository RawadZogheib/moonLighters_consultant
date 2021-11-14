import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final double circularBorderRadius;

  ErrorAlertDialog({
    this.title = "Error",
    required this.message,
    this.circularBorderRadius = 8.0,
    this.bgColor = Colors.white,
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
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}