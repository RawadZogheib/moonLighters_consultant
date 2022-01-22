import 'dart:convert';
import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/other/projectLogo.dart';
import 'package:process_run/shell.dart';
import 'package:shared_preferences/shared_preferences.dart';

var shell = Shell();
var path;

class MySavesCard extends StatefulWidget {
  final String type;
  final String dbType; // project_type needed for DB
  final String saveName;
  final String description;
  final Color color1; //light
  final Color color2; //dark
  final String asset;
  final onTap;

  MySavesCard(
      {required this.type,
      required this.dbType,
      required this.saveName,
      required this.description,
      required this.color1,
      required this.color2,
      required this.asset,
      required this.onTap});

  @override
  State<MySavesCard> createState() => _MySavesCardState();
}

class _MySavesCardState extends State<MySavesCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: widget.color1.withOpacity(0.2),
      splashColor: widget.color1.withOpacity(0.2),
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
              height: 170,
              width: 120,
              decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [widget.color1, widget.color2],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10, right: 31),
                      child: ProjectLogo(asset: widget.asset)),
                  Container(
                    margin: EdgeInsets.only(top: 8.0, right: 31),
                    child: Text(
                      widget.type,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 14,
                          color: globals.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 31.0),
                    child: Text(
                      widget.saveName,
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
              margin: EdgeInsets.only(top: 145, left: 75),
              padding: EdgeInsets.only(right: 7.0),
              decoration: new BoxDecoration(
                color: Colors.transparent.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () async {
                  ;
                  // //Navigator.pushNamed(context, '/MyTimer');
                  var path = Directory("./projects");
                  if ((!await path.exists())) {
                    path.create();
                  }
                  path = Directory("./projects/${globals.contrat_Id}");
                  if ((!await path.exists())) {
                    path.create();
                  }
                  widget.onTap();
                  _createProject();
                },
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
                      colors: [widget.color1, widget.color2],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(
                  top: 84.0, bottom: 8.0, right: 8.0, left: 8.0),
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
                                  fontSize: 12,
                                  color: globals.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.description,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 12,
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
                margin: EdgeInsets.only(top: 20, left: 23),
                child: ProjectLogo(asset: widget.asset)),
          ],
        ),
      ),
    );
  }

  _createProject() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var account_Id = localStorage.getString("Id");
    var data = {
      'version': globals.version,
      'account_Id': account_Id,
      'contrat_Id': globals.contrat_Id,
      'project_description': globals.project_description,
      'project_name': globals.project_name,
      'code_TpProject': widget.dbType
    };
    print("fffffffffffffff" + data.toString());
    var res = await CallApi()
        .postData(data, 'Project/Control/(Control)createProject.php');
    print(res.body);
    List<dynamic> body = json.decode(res.body);

    if (body[0] == "success") {
      print("success");
    } else if (body[0] == "error13") {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(globals.error13),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
