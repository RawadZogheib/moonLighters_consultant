



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;

import '../api/my_api.dart';
import '../widgets/button/myButton.dart';
import '../widgets/code/codeDialogForgetPass.dart';
import '../widgets/other/errorAlertDialog.dart';
import '../widgets/textInput/myErrorText.dart';
import '../widgets/textInput/myTextInput.dart';
import 'Login.dart';

Color colEmail = globals.blue; //email
Color colEmail_1 = globals.blue_1;
Color colEmail_2 = globals.blue_2;

String errEmailForget = ''; //email error
Color colErrEmailForget = globals.transparent;

class forgetPass extends StatefulWidget {
  const forgetPass({Key? key}) : super(key: key);

  @override
  _forgetPassState createState() => _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {
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
                  child: Text('Enter your email to continue'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextInput(
                      textString: "Enter Your Email Address",
                      labelText: 'Enter Your Email Address',
                      colBlue: colEmail,
                      colBlue_1: colEmail_1,
                      colBlue_2: colEmail_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        globals.emailForgetPass = value;
                      }),
                ),

                myErrorText(errorText: errEmailForget, color: colErrEmailForget),


                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: InkWell(
                    child: btn(btnText: "Submit"),
                    onTap: () {
                      try {
                        _verifAcc();
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ErrorAlertDialog(
                                    message: globals.errorException));
                      }
                    },
                  ),
                )],
            )
          ],
        ),
      ),
    );
  }

  _verifAcc(){
    errEmailForget = '';
    bool isEmpty = false;

    if (globals.emailForgetPass != null && globals.emailForgetPass != '') {
      setState(() {
        colEmail = Colors.blue.shade50;
        colEmail_1 = Colors.blue.shade900;
        colEmail_2 = Colors.blue.shade900.withOpacity(0.5);
      });
    } else {
      isEmpty = true;
      setState(() {
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        errEmailForget = globals.error7;
        colErrEmailForget = globals.red_1;
      });
    }
    if (isEmpty == false) {
      _checkIsRegist();
    } else {
      //do nothing
    }

  }

  _checkIsRegist() async {
    errEmailForget = '';
    try {
      var data = {
        'version': globals.version,
        'email': globals.emailForgetPass,
      };

      var res =
      await CallApi().postData(data, 'Login/Control/(Control)checkIfIsRegist.php');
      print(res);
      print(res.body);

      List<dynamic> body = json.decode(res.body);

      if (body[0] == "true") {
        showDialog(
            context: context,
            builder: (BuildContext context) => codeDialogForgetPass()).then((exit) {
          setState(() {
            //_nullTextCode();
          });
        });
      }else if(body[0] == "error7"){
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          errEmailForget = globals.error7;
          colErrEmailForget = globals.red_1;
        });
      }else if(body[0] == "error11"){
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          errEmailForget = globals.error11;
          colErrEmailForget = globals.red_1;
        });
      }else if(body[0] == "error12"){
        colEmail = Colors.red.shade50;
        colEmail_1 = Colors.red.shade900;
        colEmail_2 = Colors.red.shade900.withOpacity(0.5);
        setState(() {
          errEmailForget = globals.error12;
          colErrEmailForget = globals.red_1;
        });
      }
    }catch(e){
      print(e);
      setState(() {
        errEmailForget = globals.errorException;
        colErrEmailForget = globals.red_1;
      });
    }
  }

  _back(){
    setState(() {
      globals.emailForgetPass = null;
    });

    errEmailForget = '';
    colErrEmailForget = globals.transparent;

    colEmail = globals.blue; //email
    colEmail_1 = globals.blue_1;
    colEmail_2 = globals.blue_2;


    Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
  }

}
