
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:mn_consultant/widgets/Button/myButton.dart';

import 'package:mn_consultant/widgets/Other/errorAlertDialog.dart';

import 'package:mn_consultant/widgets/Code/codeDialog.dart';
import 'package:mn_consultant/widgets/Code/sixCode.dart';

import 'package:mn_consultant/widgets/TextInput/myErrorText.dart';

import 'package:mn_consultant/widgets/TextInput/myTextInput.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

Color colEmail = globals.blue;               //email
Color colEmail_1 = globals.blue_1;
Color colEmail_2 = globals.blue_2;


Color colPass = globals.blue;               //password
Color colPass_1 = globals.blue_1;
Color colPass_2 = globals.blue_2;

String errTxtEmail = '';    //email error
Color colErrTxtEmail = globals.transparent;
String errTxtPass = '';     //password error
Color colErrTxtPass = globals.transparent;
String errTxt = '';         //else error
Color colErrTxt = globals.transparent;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Login",style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_circle,size: 120.0,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                    child: myTextInput(textString: "Enter Your Email Address",
                        labelText: 'Enter Your Email Address',
                        colBlue: colEmail,
                        colBlue_1: colEmail_1,
                        colBlue_2: colEmail_2,
                        textInputAction: TextInputAction.next,
                        spaceAllowed: false,
                        obscure: false ,
                        onChange: (value){
                          globals.email = value;
                        }),
                  ),

                  myErrorText(errorText: errTxtEmail, color: colErrTxtEmail),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                    child: myTextInput(
                      textString: "Enter Your Password",
                      labelText: 'Enter Your Password',
                      colBlue: colPass,
                      colBlue_1: colPass_1,
                      colBlue_2: colPass_2,
                      maxLines: 1,
                      textInputAction: TextInputAction.none,
                      spaceAllowed: false,
                      obscure: true,
                      onChange: (value){
                        globals.password = value;
                        //print(globals.password);
                      },
                    ),
                  ),

                  myErrorText(errorText: errTxtPass, color: colErrTxtPass),

                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: InkWell(
                      child: btn(btnText: "Submit"),
                      onTap: (){
                        try {
                          _LoginCtrl();
                        }catch(e){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => ErrorAlertDialog(
                                  message: globals.errorException));
                        }
                      },
                    ),
                  ),

                  myErrorText(errorText: errTxt, color: colErrTxt),

                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("didn't have an account? "),
                        Row(
                          children: [
                            InkWell(
                              child: Text("create new one",style: TextStyle(
                                  color: Colors.blue
                              ),),
                              onTap: (){
                                Navigator.pushNamed(context, '/Registration');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  _LoginCtrl(){
    bool isEmpty = false;

     errTxtEmail = '';
     colErrTxtEmail = globals.transparent;
     errTxtPass = '';
     colErrTxtPass = globals.transparent;


    if(globals.email != null && globals.email != ''){
      setState(() {
        colEmail = Colors.blue.shade50;
        colEmail_1 = Colors.blue.shade900;
        colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    }else{
      isEmpty = true;
      setState(() {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        errTxtEmail = globals.error7;
        colErrTxtEmail = globals.red_1;
      });
    }

    if(globals.password != null && globals.password != ''){
      setState(() {
        colPass = Colors.blue.shade50;
        colPass_1 = Colors.blue.shade900;
        colPass_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    }else{
      isEmpty = true;
      setState(() {
        colPass = Colors.red.shade50;
        colPass_1 = Colors.red.shade900;
        colPass_2 = Colors.red.shade900.withOpacity(0.5);
        errTxtPass = globals.error7;
        colErrTxtPass = globals.red_1;
      });
    }

    if(isEmpty == false){
      _verifc();
    }else{
      //do nothing
    }

  }



  _verifc() async{
    errTxt = '';

    try {
      print("hey");
      // if(globals.email != null && globals.password != null){
      // print(globals.email);
      // print(globals.password);
      var data = {
        'version': globals.version,
        'email': globals.email,
        'password': globals.password
      };

      var res = await CallApi().postData(
          data, 'Login/Control/(Control)Login.php');
      print(res);
      print(res.body);
      //print("pppppp");
      List<dynamic> body = json.decode(res.body);

      //print(body[1]);
      //print("welcome");
      if (body[0] == "success") {

        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body[1][0]);

        //print(body[1][0]);

        //print(body[1][1]);
          globals.Id = body[1][1].toString();
          //print(body[1][2]);
          globals.fName = body[1][2].toString();
          //print(body[1][3]);
          globals.lName = body[1][3].toString();
          //print(body[1][4]);
          globals.userName = body[1][4].toString();
        //print(body[1][5]);
          globals.email = body[1][5].toString();
        //print(body[1][6]);
          globals.phoneNumber = body[1][6].toString();
        //print(body[1][7]);
          globals.gender = body[1][7].toString();
        //print(body[1][8]);
          globals.dateOfBirth = body[1][8].toString();



        // print("globalsid = ${globals.id} globFName = ${globals.fName} \n globLName = ${globals.lName} globUsernm = ${globals.userName} \n"
        //     "globpass = ${globals.password} globEmail = ${globals.email} globPhone = ${globals.phoneNumber} globGend = ${globals.gender} \n"
        //     "globDate = ${globals.dateOfBirth}");

        Navigator.pushNamed(context, '/Contrat');

        // Navigator.pushNamed(context, '/home');

      // }else if (body[0] == "errorToken") {
      //   setState(() {
      //     errTxt = globals.errorToken;
      //     colErrTxt = globals.red_1;
      //   });
      }else if (body[0] == "errorVersion") {
        setState(() {
          errTxt = "Your version: " + globals.version + "\n" + globals.errorVersion;
          colErrTxt = globals.red_1;
        });
      }else if (body[0] == "error8") {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        colPass = Colors.red.shade50;
        colPass_1 = Colors.red.shade900;
        colPass_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          errTxt = globals.error8;
          colErrTxt = globals.red_1;
        });
      } else{
        setState(() {
          errTxt = globals.errorElse;
          colErrTxt = globals.red_1;
        });
      }

     }catch(e){
       print(e);
       setState(() {
         errTxt = globals.errorException;
         colErrTxt = globals.red_1;
       });
     }
  }

  _back(){
    globals.email = null;
    globals.password = null;
    setState(() {
       colEmail = globals.blue;               //email
       colEmail_1 = globals.blue_1;
       colEmail_2 = globals.blue_2;

       colPass = globals.blue;               //password
       colPass_1 = globals.blue_1;
       colPass_2 = globals.blue_2;

       errTxtEmail = '';    //email error
       colErrTxtEmail = globals.transparent;
       errTxtPass = '';     //password error
       colErrTxtPass = globals.transparent;
       errTxt = '';         //else error
       colErrTxt = globals.transparent;
       Navigator.pushNamedAndRemoveUntil(context,'/FirstPage', (route) => false);
    });
  }

}