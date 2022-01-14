import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/hexColor/hexColor.dart';
import 'package:mn_consultant/widgets/contratCard/myContratCard.dart';
import 'package:mn_consultant/widgets/other/plusContratCard.dart';
import 'package:mn_consultant/widgets/popup/ContainerAttachedFile.dart';
import 'package:mn_consultant/widgets/popup/errorAlertDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
String _status = "0";
//
final children = <Widget>[];

class contrat extends StatefulWidget {
  @override
  _contratState createState() => _contratState();
}

class _contratState extends State<contrat> {
  List<String> type = ["1", "2"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadPage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            new IconButton(
                icon: new Icon(Icons.account_balance_wallet),
                onPressed: () {
                  Navigator.pushNamed(context, '/WalletPage');
                }),
          ],
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

  _createCards(String Id, String saveName, String description,
      String dollar_per_hour, String max_payment, String code) {
    HexColor color1;
    HexColor color2;
    if (_status == "0") {
      _status = "1";
      color1 = HexColor("#41a5ee"); //light
      color2 = HexColor("#103f91"); //dark

    } else if (_status == "1") {
      _status = "0";
      color1 = HexColor("#ca64ea"); //light
      color2 = HexColor("#7719aa"); //dark

    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: "\"$_status\" is not a type of file."));
      return Container();
    }
    return MyContratCard(
      Id: Id,
      saveName: saveName,
      text: "test1",
      description: description,
      dollar_per_hour: dollar_per_hour,
      max_payment: max_payment,
      code: code,
      color1: color1,
      //light
      color2: color2,
      //dark
      asset: 'Assets/Office/accessLogo.png',
      onTap: () async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('contrat_Id', Id);
        localStorage.setString('contrat_name', saveName);
        localStorage.setString('contrat_description', description);
        localStorage.setString('contrat_dollar_per_hour', dollar_per_hour);
        localStorage.setString('contrat_max_payment', max_payment);
        localStorage.setString('contrat_code', code);
        Navigator.pushNamed(context, '/Project');
      },
    );
    //break;
  }


  void _loadPage() async {
    try {
      children.clear();
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      globals.Id = localStorage.getString('Id');
      globals.fName = localStorage.getString('fName');
      globals.lName = localStorage.getString('lName');
      globals.userName = localStorage.getString('userName');
      globals.email = localStorage.getString('email');
      globals.phoneNumber = localStorage.getString('phoneNumber');
      globals.gender = localStorage.getString('gender');
      globals.dateOfBirth = localStorage.getString('dateOfBirth');

      var data = {
        'version': globals.version,
        'account_Id': globals.Id,
      };
      var res = await CallApi()
          .postData(data, 'Contrat/Control/(Control)loadContratConsultant.php');

      print(res.body);
      List<dynamic> body = json.decode(res.body);

      //print("hellozzzzzzz");

      if (body[0] == "success") {
        //SharedPreferences localStorage = await SharedPreferences.getInstance();
        //localStorage.setString('token', body[1]);

        for (var i = 0; i < body[1].length; i++) {
          //localStorage.setString('contrat_Id', value)
          children.add(_createCards(
            body[1][i][0], //contrat_Id
            body[1][i][1], //contrat_name
            body[1][i][2], //contrat_description
            body[1][i][3], //contrat_dollar_per_hour
            body[1][i][4], //contrat_max_payment
            body[1][i][5], //contrat_code
          )
          );
          // print("childrennnnnn");
          // print(children.length);
          // print("welcomeeee");
          // print(body[2][i][0]);
          // print(body[2][i][1]);
          // print(body[2][i][2]);
          // print(body[2][i][3]);
          // print(body[2][i][4]);
          // print(body[2][i][5]);
        }
        if(mounted){
          setState(() {
            children.add(PlusContratCard(
              onTap: () {
                //Set null to use these variable to create a new contrat
                globals.contrat_Id = null;
                globals.contrat_name = null;
                globals.contrat_dollar_per_hour = null;
                globals.contrat_max_payment = null;
                globals.contrat_description = null;
                globals.contrat_code = null;
              },
            ));
          });
        }

      } else if (body[0] == "error4") {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error4));
      } else if (body[0] == "errorToken") {
        children.clear();

        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.errorToken,
                  goHome: true,
                  onPress: () {
                    _globRegist();
                  },
                ));
      } else if (body[0] == "errorVersion") {
        children.clear();

        // print("errorrrrrrVersionnnnnn");
        // print("${globals.Id}  ${globals.userName}  ${globals.email}  ${globals.dateOfBirth}  ${globals.gender}  ${globals.fName}  ${globals.lName}\n");
        // print("${globals.Id}  ${globals.userName}  ${globals.email}  ${globals.dateOfBirth}  ${globals.gender}  ${globals.fName}  ${globals.lName}\n");

        showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertDialog(
                  message: globals.errorVersion,
                  goHome: true,
                  onPress: () {
                    _globRegist();
                  },
                ));
      } else if (body[0] == "error10") {
        setState(() {
          children.add(PlusContratCard(
            onTap: () {
              //Set null to use these variable to create a new contrat
              globals.contrat_Id = null;
              globals.contrat_name = null;
              globals.contrat_dollar_per_hour = null;
              globals.contrat_max_payment = null;
              globals.contrat_description = null;
              globals.contrat_code = null;
            },
          ));
        });
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.error10));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                ErrorAlertDialog(message: globals.errorElse));
      }
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorException));
    }
  }

  _back() {
    //exit(0);
    // globals.contrat_Id = null;
    // globals.contrat_name = null;
    // globals.contrat_dollar_per_hour = null;
    // globals.contrat_max_payment = null;
    // globals.contrat_description = null;
    // globals.contrat_code = null;
    // children.clear();
    // Navigator.of(context).pop();
  }

  //set null for all globals Registration without the globals Password and RePassword
  _globRegist() {
    setState(() {
      globals.Id = null;
      globals.email = null;
      globals.fName = null;
      globals.lName = null;
      globals.gender = null;
      globals.phoneNumber = null;
      globals.userName = null;
      globals.dateOfBirth = null;
    });
  }
}
