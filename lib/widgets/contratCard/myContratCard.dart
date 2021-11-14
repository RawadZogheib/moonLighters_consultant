import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/other/contratLogo.dart';

class MyContratCard extends StatelessWidget {
  final String Id;
  final String saveName;
  final String text;
  final String description;
  final String dollar_per_hour;
  final String max_payment;
  final String code;
  final Color color1; //light
  final Color color2; //dark
  String asset;
  final onTap;

  MyContratCard({
    required this.Id,
    required this.text,
    required this.saveName,
    required this.description,
    required this.dollar_per_hour,
    required this.max_payment,
    required this.code,
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
      child: FlipCard(
        fill: Fill.fillBack,
        // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL,
        // default

        //front
        front: Stack(
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
                  Container(
                    child: Text(
                      text,
                      maxLines: 2,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 11,
                        color: globals.white,
                        //fontWeight: FontWeight.bold
                      ),
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

        //back
        back: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
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
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(
                  top: 76.0, bottom: 8.0, right: 8.0, left: 8.0),
              child: Container(
                padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Description: ",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: globals.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            description,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 13,
                              color: globals.white,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              margin: const EdgeInsets.only(top: 18.0, right: 105),
              padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Price: ",
                      style: TextStyle(fontSize: 13,
                          color: globals.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      dollar_per_hour,
                      style: TextStyle(fontSize: 13,color: globals.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: 100,
              margin: const EdgeInsets.only(top: 18.0, left: 105),
              padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Code: ",
                      style: TextStyle(fontSize: 13,
                          color: globals.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      code,
                      style: TextStyle(fontSize: 13,color: globals.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 30,
              width: 205,
              margin: const EdgeInsets.only(top: 52.0, right: 0),
              padding: const EdgeInsets.only(top: 6.0, bottom: 5.0),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Max Payment: ",
                      style: TextStyle(fontSize: 13,
                          color: globals.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      max_payment,
                      style: TextStyle(fontSize: 13,color: globals.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
