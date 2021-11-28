import 'dart:ffi';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/other/contratLogo.dart';

class demoFolder extends StatelessWidget {
  final String Id;
  final String saveName;
  final Color color1; //light
  final Color color2; //dark
  String asset;
  final onTap;

  demoFolder({
    required this.Id,
    required this.saveName,
    required this.color1,
    required this.color2,
    required this.asset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: color1.withOpacity(0.2),
      splashColor: color1.withOpacity(0.2),
      child: Card(


        // default

        //front
        child:Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 175,
              width: 220,
              decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [color1, color2],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10), child: ContratLogo()),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(
                      saveName,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 14,
                          color: globals.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 145, left: 155),
              padding: EdgeInsets.only(right: 7.0),
              decoration: new BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: onTap,
                child: Transform.rotate(
                    angle: -180 * 3.14159265359 / 180,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: globals.white,
                      size: 18,
                    )),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
