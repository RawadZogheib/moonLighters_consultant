

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;

import '../api/my_api.dart';
import '../widgets/button/myButton.dart';
import '../widgets/other/errorAlertDialog.dart';
import '../widgets/textInput/myErrorText.dart';
import '../widgets/textInput/myTextInput.dart';
import 'forgetPassword.dart';

RegExp passExp = new RegExp(
    r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");

Color colPass = globals.blue; //newPassword
Color colPass_1 = globals.blue_1;
Color colPass_2 = globals.blue_2;

Color colPass2 = globals.blue; //newPassword2
Color colPass2_1 = globals.blue_1;
Color colPass2_2 = globals.blue_2;

String errPass = '';
Color colErrPass = globals.transparent;
String errPass2 = '';
Color colErrPass2 = globals.transparent;


class forgetPass2 extends StatefulWidget {
  const forgetPass2({Key? key}) : super(key: key);

  @override
  _forgetPass2State createState() => _forgetPass2State();
}

class _forgetPass2State extends State<forgetPass2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Enter your New Password to continue'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextInput(
                      textString: "Enter Your New Password",
                      labelText: 'Enter Your New Password',
                      colBlue: colPass,
                      colBlue_1: colPass_1,
                      colBlue_2: colPass_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      maxLines: 1,
                      onChange: (value) {
                        globals.newPassword = value;
                      }),
                ),

                myErrorText(errorText: errPass, color: colErrPass),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextInput(
                      textString: "reEnter Your New Password",
                      labelText: 'reEnter Your New Password',
                      colBlue: colPass2,
                      colBlue_1: colPass2_1,
                      colBlue_2: colPass2_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      maxLines: 1,
                      onChange: (value) {
                        globals.newPassword2 = value;
                      }),
                ),

                myErrorText(errorText: errPass2, color: colErrPass2),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: InkWell(
                    child: btn(btnText: "Submit"),
                    onTap: () {
                      try {
                        _verifPass();
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ErrorAlertDialog(
                                    message: globals.errorException));
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),);
  }


  _verifPass(){
    errPass = '';
    errPass2 = '';
    bool isEmpty = false;

    if (globals.newPassword != null && globals.newPassword != '') {
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
        errPass = globals.error7;
        colErrPass = globals.red_1;
      });
    }

    if (globals.newPassword2 != null && globals.newPassword2 != '') {
      setState(() {
        colPass2 = Colors.blue.shade50;
        colPass2_1 = Colors.blue.shade900;
        colPass2_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    }else{
      isEmpty = true;
      setState(() {
        colPass2 = Colors.red.shade50;
        colPass2_1 = Colors.red.shade900;
        colPass2_2 = Colors.red.shade900.withOpacity(0.5);
        errPass2 = globals.error7;
        colErrPass2 = globals.red_1;
      });
    }

    if(isEmpty == false){
      if (!passExp.hasMatch(globals.newPassword!)) {
        setState(() {
          colPass = globals.red;
          colPass_1 = globals.red_1;
          colPass_2 = globals.red_2;
          colErrPass = globals.red_1;
          errPass = globals.error2_3;
        });
      } else if (globals.newPassword!.length < 8) {
        setState(() {
          colPass = globals.red;
          colPass_1 = globals.red_1;
          colPass_2 = globals.red_2;
          colErrPass = globals.red_1;
          errPass = globals.error2_3;
        });
      } else if (globals.newPassword != globals.newPassword2) {
        setState(() {
          colPass2 = globals.red;
          colPass2_1 = globals.red_1;
          colPass2_2 = globals.red_2;
          colErrPass2 = globals.red_1;
          errPass2 = globals.error3;
        });
      } else{
        _checkPass();
      }
    }
  }

  _checkPass() async {
    errPass = '';
    errPass2 = '';
    colErrPass = globals.transparent;
    colErrPass2 = globals.transparent;

    try {
      var data = {
        'version': globals.version,
        'email': globals.emailForgetPass,
        'password': globals.newPassword,
        'repassword': globals.newPassword2,
      };

      var res =
      await CallApi().postData(
          data, 'Login/Control/(Control)checkNewPassword.php');
      print(res);
      print(res.body);

      List<dynamic> body = json.decode(res.body);

      if (body[0] == "true") {
        Navigator.pushNamed(context, '/Login');
      }else if(body[0] == "error2_3"){
        setState(() {
          colPass = globals.red;
          colPass_1 = globals.red_1;
          colPass_2 = globals.red_2;
          colErrPass = globals.red_1;
          errPass = globals.error2_3;
        });
      }else if(body[0] == "error3"){
        setState(() {
          colPass2 = globals.red;
          colPass2_1 = globals.red_1;
          colPass2_2 = globals.red_2;
          colErrPass2 = globals.red_1;
          errPass2 = globals.error3;
        });
      }else if(body[0] == "error7"){
        setState(() {
          colErrPass2 = globals.red_1;
          errPass2 = globals.error7;
        });
      }
    }catch(e){
      print(e);
      setState(() {
        errPass2 = globals.errorException;
        colErrPass2 = globals.red_1;
      });
    }
  }

  _back(){
    errPass = '';
    colErrPass = globals.transparent;
    colPass = Colors.blue.shade50;
    colPass_1 = Colors.blue.shade900;
    colPass_2 = Colors.blue.shade900.withOpacity(0.5);

    errPass2 = '';
    colErrPass2 = globals.transparent;
    colPass2 = Colors.blue.shade50;
    colPass2_1 = Colors.blue.shade900;
    colPass2_2 = Colors.blue.shade900.withOpacity(0.5);

    globals.newPassword = null;
    globals.newPassword2 = null;

  }
}
