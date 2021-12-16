import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/button/myButton.dart';
import 'package:mn_consultant/widgets/Code/codeDialog.dart';
import 'package:mn_consultant/widgets/Code/sixCode.dart';
import 'package:mn_consultant/widgets/dateOfBirth/myDateOfBirth.dart';
import 'package:mn_consultant/widgets/popup/errorAlertDialog.dart';
import 'package:mn_consultant/widgets/radioButton/myRadioButton.dart';
import 'package:mn_consultant/widgets/textInput/myErrorText.dart';
import 'package:mn_consultant/widgets/textInput/myTextInput.dart';


RegExp passExp = new RegExp(
    r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[*.!@#$%^&:,?_-]).{8,}$");
RegExp exp = new RegExp(r"^[a-zA-Z0-9_\.]*$", caseSensitive: false);
RegExp mailExp =
new RegExp(r"[a-zA-Z0-9]+@(g|hot)mail.com$", caseSensitive: false);
RegExp phoneExp = new RegExp(
    r"(961|1|86|357|20|33|91|39)[0-9]{8}\b"); //lebanon, american or canada, china, cyprus, egypt, france, india, italy

Color colFName = globals.blue; //fname
Color colFName_1 = globals.blue_1;
Color colFName_2 = globals.blue_2;

Color colLName = globals.blue; //lname
Color colLName_1 = globals.blue_1;
Color colLName_2 = globals.blue_2;

Color colUserName = globals.blue; //username
Color colUserName_1 = globals.blue_1;
Color colUserName_2 = globals.blue_2;

Color colPass = globals.blue; //password
Color colPass_1 = globals.blue_1;
Color colPass_2 = globals.blue_2;

Color colRePass = globals.blue; //repassword
Color colRePass_1 = globals.blue_1;
Color colRePass_2 = globals.blue_2;

Color colPhoneNb = globals.blue; //phoneNumber
Color colPhoneNb_1 = globals.blue_1;
Color colPhoneNb_2 = globals.blue_2;

Color colEmail = globals.blue; //email
Color colEmail_1 = globals.blue_1;
Color colEmail_2 = globals.blue_2;

Color colRadioMale = globals.blue; // background color for gender button
Color colRadioMale_1 = globals.blue_1;
Color colRadioFem = globals.blue;
Color colRadioFem_1 = globals.blue_1;



String errTxtFname = ''; // for error textFields
Color colErrTxtFname = globals.transparent;
String errTxtLname = ''; // for error textFields
Color colErrTxtLname = globals.transparent;
String errTxtUsr = ''; // for error textFields
Color colErrTxtUsr = globals.transparent;
String errTxtEmail = ''; // for error textFields
Color colErrTxtEmail = globals.transparent;
String errTxtPass = ''; // for error textFields
Color colErrTxtPass = globals.transparent;
String errTxtRepass = ''; // for error textFields
Color colErrTxtRepass = globals.transparent;
String errTxtPhone = ''; // for error textFields
Color colErrTxtPhone = globals.transparent;
String errTxtGender = '';//genderError
Color colErrTxtGender = globals.transparent;
String errTxtDate = ''; //date ErrorText
Color colErrTxtDate = globals.transparent;
String errTxt = '';
Color colErrTxt = globals.transparent;

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    globals.clearRegist();
    _clearColor();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _back(),
      child: Scaffold(
        backgroundColor: globals.whiteBlue,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sign up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                _back();
              }),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Create Your Account",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 8.0, right: 15.0, bottom: 8.0),
                          child: myTextInput(
                            textString: "First Name",
                            labelText: 'First Name',
                            colBlue: colFName,
                            colBlue_1: colFName_1,
                            colBlue_2: colFName_2,
                            textInputAction: TextInputAction.next,
                            spaceAllowed: false,
                            obscure: false,
                            onChange: (value) {
                              globals.fName = value;
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 8.0, right: 20.0, bottom: 8.0),
                          child: myTextInput(
                            textString: "Last Name",
                            labelText: 'Last Name',
                            colBlue: colLName,
                            colBlue_1: colLName_1,
                            colBlue_2: colLName_2,
                            textInputAction: TextInputAction.next,
                            spaceAllowed: true,
                            obscure: false,
                            onChange: (value) {
                              globals.lName = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 28.0, bottom: 8.0),
                        child: Container(
                          child: myErrorText(
                              errorText: errTxtFname, color: colErrTxtFname),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, bottom: 8.0, right: 28.0),
                        child: Container(
                          child: myErrorText(
                              errorText: errTxtLname, color: colErrTxtLname),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                    child: myTextInput(
                      textString: "UserName",
                      labelText: 'UserName',
                      colBlue: colUserName,
                      colBlue_1: colUserName_1,
                      colBlue_2: colUserName_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        globals.userName = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: errTxtUsr, color: colErrTxtUsr),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                    child: myTextInput(
                      textString: "Email Address",
                      labelText: 'Email Address',
                      colBlue: colEmail,
                      colBlue_1: colEmail_1,
                      colBlue_2: colEmail_2,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        globals.email = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: errTxtEmail, color: colErrTxtEmail),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                    child: myTextInput(
                      textString: "Password",
                      labelText: 'Password',
                      colBlue: colPass,
                      colBlue_1: colPass_1,
                      colBlue_2: colPass_2,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      onChange: (value) {
                        globals.password = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: errTxtPass, color: colErrTxtPass),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 8.0, right: 20.0, bottom: 8.0),
                    child: myTextInput(
                      textString: "ReEnterPassword",
                      labelText: 'ReEnterPassword',
                      colBlue: colRePass,
                      colBlue_1: colRePass_1,
                      colBlue_2: colRePass_2,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      spaceAllowed: false,
                      obscure: true,
                      onChange: (value) {
                        globals.repassword = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: errTxtRepass, color: colErrTxtRepass),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 8.0, right: 20.0),
                    child: myTextInput(
                      textString: "Phone Number",
                      labelText: 'Phone Number',
                      keybType: TextInputType.numberWithOptions(decimal: true),
                      colBlue: colPhoneNb,
                      colBlue_1: colPhoneNb_1,
                      colBlue_2: colPhoneNb_2,
                      textInputAction: TextInputAction.done,
                      prefixText: "+",
                      spaceAllowed: false,
                      obscure: false,
                      onChange: (value) {
                        globals.phoneNumber = value;
                      },
                    ),
                  ),
                  myErrorText(errorText: errTxtPhone, color: colErrTxtPhone),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: myRadioButton(
                          text: ' Male ',
                          color: colRadioMale,
                          color_1: colRadioMale_1,
                          onPressed: () {
                            globals.gender = 'Male';
                            setState(() {
                              colRadioMale = globals.blue_1;
                              colRadioMale_1 = globals.blue;
                              colRadioFem = globals.blue;
                              colRadioFem_1 = globals.blue_1;
                            });

                            //print(globals.gender);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: myRadioButton(
                          text: 'Female',
                          color: colRadioFem,
                          color_1: colRadioFem_1,
                          onPressed: () {
                            globals.gender = 'Female';
                            setState(() {
                              colRadioFem = globals.blue_1;
                              colRadioFem_1 = globals.blue;
                              colRadioMale = globals.blue;
                              colRadioMale_1 = globals.blue_1;
                            });
                            //print(globals.gender);
                          },
                        ),
                      ),
                    ],
                  ),
                  myErrorText(errorText: errTxtGender, color: colErrTxtGender),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
                    child: myDateOfBirth(),
                  ),
                  myErrorText(errorText: errTxtDate, color: colErrTxtDate),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: InkWell(
                        child: btn(btnText: "Confirm"),
                        onTap: () {
                          _nullErr();
                        }),
                  ),

                  myErrorText(errorText: errTxt, color: colErrTxt),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _nullErr() async {
    bool isEmpty = false;

    try {
      if (globals.fName != null && globals.fName != '') {
        setState(() {
          colFName = globals.blue;
          colFName_1 = globals.blue_1;
          colFName_2 = globals.blue_2;
          errTxtFname = '';
        });
        //color blue
        //text1.clear()
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtFname = globals.red_1;
          colFName = globals.red;
          colFName_1 = globals.red_1;
          colFName_2 = globals.red_2;
          errTxtFname = globals.error7;
        });
        //color red
        //text1 = globals.error1;
      }

      if (globals.lName != null && globals.lName != '') {
        setState(() {
          colLName = globals.blue;
          colLName_1 = globals.blue_1;
          colLName_2 = globals.blue_2;
          errTxtLname = '';
        });
        //color blue
        // text2.clear()
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtLname = globals.red_1;
          colLName = globals.red;
          colLName_1 = globals.red_1;
          colLName_2 = globals.red_2;
          errTxtLname = globals.error7;
        });
        //color red
        //text2 = globals.error1;
      }

      if (globals.userName != null && globals.userName != '') {
        setState(() {
          colUserName = globals.blue;
          colUserName_1 = globals.blue_1;
          colUserName_2 = globals.blue_2;
          errTxtUsr = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtUsr = globals.red_1;
          colUserName = globals.red;
          colUserName_1 = globals.red_1;
          colUserName_2 = globals.red_2;
          errTxtUsr = globals.error7;
        });
      }

      if (globals.email != null && globals.email != '') {
        setState(() {
          colEmail = globals.blue;
          colEmail_1 = globals.blue_1;
          colEmail_2 = globals.blue_2;
          errTxtEmail = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtEmail = globals.red_1;
          colEmail = globals.red;
          colEmail_1 = globals.red_1;
          colEmail_2 = globals.red_2;
          errTxtEmail = globals.error7;
        });
      }

      if (globals.password != null && globals.password != '') {
        setState(() {
          colPass = globals.blue;
          colPass_1 = globals.blue_1;
          colPass_2 = globals.blue_2;
          errTxtPass = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtPass = globals.red_1;
          colPass = globals.red;
          colPass_1 = globals.red_1;
          colPass_2 = globals.red_2;
          errTxtPass = globals.error7;
        });
      }

      if (globals.repassword != null && globals.repassword != '') {
        setState(() {
          colRePass = globals.blue;
          colRePass_1 = globals.blue_1;
          colRePass_2 = globals.blue_2;
          errTxtRepass = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtRepass = globals.red_1;
          colRePass = globals.red;
          colRePass_1 = globals.red_1;
          colRePass_2 = globals.red_2;
          errTxtRepass = globals.error7;
        });
      }

      if (globals.phoneNumber != null && globals.phoneNumber != '') {
        setState(() {
          colPhoneNb = globals.blue;
          colPhoneNb_1 = globals.blue_1;
          colPhoneNb_2 = globals.blue_2;
          errTxtPhone = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtPhone = globals.red_1;
          colPhoneNb = globals.red;
          colPhoneNb_1 = globals.red_1;
          colPhoneNb_2 = globals.red_2;
          errTxtPhone = globals.error7;
        });
      }

      if (globals.gender != null && globals.gender != '') {
        setState(() {
          errTxtGender = '';
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtGender = globals.red_1;
          colRadioMale = globals.red;
          colRadioFem = globals.red;
          colRadioMale_1 = globals.red_1;
          colRadioFem_1 = globals.red_1;
          errTxtGender = globals.error7;
        });
      }

      if (globals.dateOfBirth != null && globals.dateOfBirth != '') {
        setState(() {
          colErrTxtDate = globals.transparent;
          colDateOfBirth = globals.blue;
          colDateOfBirth_1 = globals.blue_1;
          colDateOfBirth_2 = globals.blue_2;
        });
      } else {
        isEmpty = true;
        setState(() {
          colErrTxtDate = globals.red_1;
          colDateOfBirth = globals.red;
          colDateOfBirth_1 = globals.red_1;
          colDateOfBirth_2 = globals.red_2;
          errTxtDate = globals.error7;
        });
      }

      if (isEmpty == false) {
        if (!mailExp.hasMatch(globals.email!)) {
          setState(() {
            colEmail = globals.red;
            colEmail_1 = globals.red_1;
            colEmail_2 = globals.red_2;
            colErrTxtEmail = globals.red_1;
            errTxtEmail = globals.error2_5;
          });
        } else if (globals.password!.length < 8) {
          setState(() {
            colPass = globals.red;
            colPass_1 = globals.red_1;
            colPass_2 = globals.red_2;
            colErrTxtPass = globals.red_1;
            errTxtPass = globals.error2_3;
          });
        } else if (!passExp.hasMatch(globals.password!)) {
          setState(() {
            colPass = globals.red;
            colPass_1 = globals.red_1;
            colPass_2 = globals.red_2;
            colErrTxtPass = globals.red_1;
            errTxtPass = globals.error2_3;
          });
        } else if (globals.password != globals.repassword) {
          setState(() {
            colRePass = globals.red;
            colRePass_1 = globals.red_1;
            colRePass_2 = globals.red_2;
            colErrTxtRepass = globals.red_1;
            errTxtRepass = globals.error3;
          });
        } else if (globals.userName!.contains(" ")) {
          setState(() {
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            colErrTxtUsr = globals.red_1;
            errTxtUsr = globals.error1;
          });
        } else if (globals.userName!.length < 8) {
          setState(() {
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            colErrTxtUsr = globals.red_1;
            errTxtUsr = globals.error2_1;
          });
        } else if (!exp.hasMatch(globals.userName!)) {
          setState(() {
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            colErrTxtUsr = globals.red_1;
            errTxtUsr = globals.error2_2;
          });
        } else if (!phoneExp.hasMatch(globals.phoneNumber!)) {
          setState(() {
            colPhoneNb = globals.red;
            colPhoneNb_1 = globals.red_1;
            colPhoneNb_2 = globals.red_2;
            colErrTxtPhone = globals.red_1;
            errTxtPhone = globals.error9;
          });
        } else {
          _reg(); // Calling the Function for Database
        }
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              ErrorAlertDialog(message: globals.errorException));
    }
  }

  _reg() async {

    errTxtFname = ''; // for error textFields
    errTxtLname = ''; // for error textFields
    errTxtUsr = ''; // for error textFields
    errTxtEmail = ''; // for error textFields
    errTxtPass = ''; // for error textFields
    errTxtRepass = ''; // for error textFields
    errTxtPhone = ''; // for error textFields
    errTxtGender = ''; // for error textFields
    errTxtDate = ''; // for error textFields
    errTxt = '';   // for errorElse, errorVersion,...


    try {
      if (globals.email != null &&
          globals.fName != null &&
          globals.lName != null &&
          globals.userName != null &&
          globals.password != null &&
          globals.dateOfBirth != null &&
          globals.gender != null &&
          globals.phoneNumber != null) {
        //if(exp.hasMatch(globals.password!)) {
        //if (globals.password == globals.repassword) {
        var data = {
          'version': globals.version,
          'email': globals.email,
          'fname': globals.fName,
          'lname': globals.lName,
          'userName': globals.userName,
          'password': globals.password,
          'repassword': globals.repassword,
          'dateOfBirth': globals.dateOfBirth,
          'phoneNumber': globals.phoneNumber,
          'gender': globals.gender,
          'isRegistered' : globals.isRegistered
        };

        var res = await CallApi()
            .postData(data, 'Registration/Control/(Control)registration.php');

        print(res.body);
        //print("printed");
        var body = json.decode(res.body);
        //print(body);
        if (body[0] == "true") {

          //Navigator.pushNamed(context, '/Login');
          //Navigator.pushNamed(context, '/home');
          showDialog(
              context: context,
              builder: (BuildContext context) => codeDialog()).then((exit) {
            setState(() {
              _nullTextCode();
            });
          });

        } else if (body[0] == "error1") {
          setState(() {
            colErrTxtUsr = globals.red_1;
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            errTxtUsr = globals.error1;
          });
        } else if (body[0] == "error2_1") {
          setState(() {
            colErrTxtUsr = globals.red_1;
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            errTxtUsr = globals.error2_1;
          });
        } else if (body[0] == "error2_2") {
          setState(() {
            colErrTxtUsr = globals.red_1;
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            errTxtUsr = globals.error2_2;
          });
        } else if (body[0] == "error2_3") {
          setState(() {
            colPass = globals.red;
            colPass_1 = globals.red_1;
            colPass_2 = globals.red_2;
            colErrTxtPass = globals.red_1;
            errTxtPass = globals.error2_3;
          });
        } else if (body[0] == "error2_5") {
          setState(() {
            colEmail = globals.red;
            colEmail_1 = globals.red_1;
            colEmail_2 = globals.red_2;
            colErrTxtEmail = globals.red_1;
            errTxtEmail = globals.error2_5;
          });
        } else if (body[0] == "error2_7") {
          setState(() {
            colPhoneNb = globals.red;
            colPhoneNb_1 = globals.red_1;
            colPhoneNb_2 = globals.red_2;
            colErrTxtPhone = globals.red_1;
            errTxtPhone = globals.error2_7;
          });
        } else if (body[0] == "error3") {
          setState(() {
            colRePass = globals.red;
            colRePass_1 = globals.red_1;
            colRePass_2 = globals.red_2;
            colErrTxtRepass = globals.red_1;
            errTxtRepass = globals.error3;
          });
        } else if (body[0] == "error4") {
          setState(() {
            colErrTxt = globals.red_1;
            errTxt = globals.error4;
          });
        } else if (body[0] == "error5") {
          setState(() {
            colErrTxtUsr = globals.red_1;
            colUserName = globals.red;
            colUserName_1 = globals.red_1;
            colUserName_2 = globals.red_2;
            errTxtUsr = globals.error5;
          });
        } else if (body[0] == "error6") {
          setState(() {
            colErrTxtEmail = globals.red_1;
            colEmail = globals.red;
            colEmail_1 = globals.red_1;
            colEmail_2 = globals.red_2;
            errTxtEmail = globals.error6;
          });
        } else if (body[0] == "error7") {
          setState(() {
            colErrTxt = globals.red_1;
            errTxt = globals.error7;
          });
        } else if (body[0] == "errorVersion") {
          setState(() {
            colErrTxt = globals.red_1;
            errTxt = globals.errorVersion;
          });
        } else {
          print(body[0]);
          setState(() {
            colErrTxt = globals.red_1;
            errTxt = globals.errorElse;
          });
        }
        /* } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        globals.error3),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
            );
          } */
        /* }else{
          showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: const Text('Error'),
                  content: const Text(globals.error2_3,
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
          );
        }  } */
      } else {
        setState(() {
          colErrTxt = globals.red_1;
          errTxt = 'No nulls allowed';
        });
      }
    } catch (e) {
      setState(() {
        colErrTxt = globals.red_1;
        errTxt = globals.errorException;
      });
    }
  }


  _back() {
    setState(() {
      globals.clearRegist();
    });

    Navigator.pushNamedAndRemoveUntil(context, '/Login', (route) => false);
  }


  _nullTextCode(){
    globals.sixCodeNb = null;
  }

  _clearColor() {

    colFName = globals.blue; //fname
    colFName_1 = globals.blue_1;
    colFName_2 = globals.blue_2;

    colLName = globals.blue; //lname
    colLName_1 = globals.blue_1;
    colLName_2 = globals.blue_2;

    colUserName = globals.blue; //username
    colUserName_1 = globals.blue_1;
    colUserName_2 = globals.blue_2;

    colPass = globals.blue; //password
    colPass_1 = globals.blue_1;
    colPass_2 = globals.blue_2;

    colRePass = globals.blue; //repassword
    colRePass_1 = globals.blue_1;
    colRePass_2 = globals.blue_2;

    colPhoneNb = globals.blue; //phoneNumber
    colPhoneNb_1 = globals.blue_1;
    colPhoneNb_2 = globals.blue_2;

    colEmail = globals.blue; //email
    colEmail_1 = globals.blue_1;
    colEmail_2 = globals.blue_2;

    colRadioMale = globals.blue; // background color for gender button
    colRadioMale_1 = globals.blue_1;
    colRadioFem = globals.blue;
    colRadioFem_1 = globals.blue_1;

    colDateOfBirth = globals.blue;
    colDateOfBirth_1 = globals.blue_1;
    colDateOfBirth_2 = globals.blue_2;

    errTxtFname = ''; // for error textFields
    colErrTxtFname = globals.transparent;
    errTxtLname = ''; // for error textFields
    colErrTxtLname = globals.transparent;
    errTxtUsr = ''; // for error textFields
    colErrTxtUsr = globals.transparent;
    errTxtEmail = ''; // for error textFields
    colErrTxtEmail = globals.transparent;
    errTxtPass = ''; // for error textFields
    colErrTxtPass = globals.transparent;
    errTxtRepass = ''; // for error textFields
    colErrTxtRepass = globals.transparent;
    errTxtPhone = ''; // for error textFields
    colErrTxtPhone = globals.transparent;
    errTxtGender = '';//genderError
    colErrTxtGender = globals.transparent;
    errTxtDate = ''; //date ErrorText
    colErrTxtDate = globals.transparent;
    errTxt = '';
    colErrTxt = globals.transparent;
  }

}
