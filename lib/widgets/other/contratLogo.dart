import 'package:flutter/material.dart';
import 'package:mn_consultant/widgets/projectCard/accessCard.dart';

class ContratLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: new BoxDecoration(
            color: Colors.transparent.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          child: Container(
            margin: EdgeInsets.only(right: 4.0),
            child: Image(
              image: AssetImage('Assets/contratLogo/contratLogo.png'),
            ),
          ),
        ),

      ],
    );
  }
}
