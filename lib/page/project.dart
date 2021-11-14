import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mn_consultant/api/my_api.dart';

import 'package:mn_consultant/widgets/projectCard/accessCard.dart';
import 'package:mn_consultant/widgets/projectCard/excelCard.dart';
import 'package:mn_consultant/widgets/projectCard/oneNoteCard.dart';
import 'package:mn_consultant/widgets/projectCard/powerPointCard.dart';
import 'package:mn_consultant/widgets/projectCard/publisherCard.dart';
import 'package:mn_consultant/widgets/projectCard/wordCard.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/other/errorAlertDialog.dart';
import 'package:mn_consultant/widgets/other/plusProjectCard.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:shared_preferences/shared_preferences.dart';

final children = <Widget>[];

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {

  /*
  late String contrat_Id;
  late String contrat_name;
  late String contrat_description;
  late String contrat_dollar_per_hour;
  late String contrat_max_payment;
  late String contrat_code;
   */

  List<String> type = [
    "asfasd",
    "Word",
    "Word",
    "Excel",
    "Excel",
    "PowerPoint",
    "PowerPoint",
    "Access",
    "Access",
    "OneNote",
    "OneNote",
    "Publisher",
    "Publisher"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkVariables();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tracking App"),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                _back();
              }),
        ),
        backgroundColor: globals.whiteBlue,
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Wrap(
                children: children,
                //new Card(child: Text('B'))
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createCards(String Id, String saveName, String description, String type) {
    print(type);

    switch (type) {
      case "Microsoft Word":
        {
          return WordCard(saveName: saveName, description: description);
          //break;
        }
      case "Microsoft Excel":
        {
          return ExcelCard(saveName: saveName, description: description);
        }
      case "Microsoft PowerPoint":
        {
          return PowerPointCard(saveName: saveName, description: description);
        }
      case "Microsoft Access":
        {
          return AccessCard(saveName: saveName, description: description);
        }
      case "Microsoft OneNote":
        {
          return OneNoteCard(saveName: saveName, description: description);
        }
      case "Microsoft Publisher":
        {
          return PublisherCard(saveName: saveName, description: description);
        }
      default:
        {
          showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertDialog(
                  message: "\"$type\" is not a type of file."));
          return Container();
        }
    }
  }

  void _loadPage() async {
    var data = {
      'version':globals.version,
      'account_Id': globals.Id,
      'contrat_Id': globals.contrat_Id,
    };
    var res = await CallApi().postData(data, 'Project/Control/(Control)loadProject.php');
    print(res.body);
    List<dynamic> body = json.decode(res.body);

    if (body[0] == "success") {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body[1]);

      for (var i = 0; i < body[2].length; i++) {
        children.add(_createCards(
          body[2][i][0], //project_Id
          body[2][i][1], //project_name
          body[2][i][2], //project_description
          body[2][i][3], //project_type
        ));
      }
      setState(() {
        children.add(PlusProjectCard());
      });
    }else if(body[0] == "error4"){
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorAlertDialog(
              message: globals.error4));
    }else if(body[0] == "error10"){
      setState(() {
        children.add(PlusProjectCard());
      });
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorAlertDialog(
              message: globals.error10));
    } else if (body[0] == "errorToken") {
      children.clear();
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorToken, goHome: true));
    } else if(body[0] == "errorVersion"){
      children.clear();
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorVersion, goHome: true));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorAlertDialog(
              message: globals.errorElse));
    }
  }


  void _checkVariables() async {
    if (globals.contrat_Id == null ||
        globals.contrat_name == null ||
        globals.contrat_description == null ||
        globals.contrat_dollar_per_hour == null ||
        globals.contrat_max_payment == null ||
        globals.contrat_code == null) {
      print("Error: variable error page /Contrat");
      await Future.delayed(Duration(seconds: 1));
      //await Future.delayed(const Duration(seconds: 2), (){});
      Navigator.of(context).pop();
    } else {
      /*
      contrat_Id = globals.contrat_Id.toString();
      contrat_name = globals.contrat_name.toString();
      contrat_description = globals.contrat_description.toString();
      contrat_dollar_per_hour = globals.contrat_dollar_per_hour.toString();
      contrat_max_payment = globals.contrat_max_payment.toString();
      contrat_code = globals.contrat_code.toString();

      globals.contrat_Id = null;
      globals.contrat_name = null;
      globals.contrat_description = null;
      globals.contrat_dollar_per_hour = null;
      globals.contrat_max_payment = null;
      globals.contrat_code = null;
     */
      _loadPage();
    }
  }


  _back() {
    globals.contrat_Id = null;
    globals.contrat_name = null;
    globals.contrat_dollar_per_hour = null;
    globals.contrat_max_payment = null;
    globals.contrat_description = null;
    globals.contrat_code = null;
    children.clear();
    Navigator.of(context).pop();
  }
}
