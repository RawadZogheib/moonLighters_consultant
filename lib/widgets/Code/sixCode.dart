import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mn_consultant/api/my_api.dart';
import 'package:mn_consultant/widgets/Button/myButton.dart';
import 'package:mn_consultant/widgets/Code/myCode.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:mn_consultant/widgets/Button/myButton.dart';
import 'package:mn_consultant/widgets/TextInput/myErrorText.dart';

import 'myCode.dart';

String errCode = '';
Color colErrCode = globals.transparent;



class sixCode extends StatefulWidget {
  const sixCode({Key? key}) : super(key: key);

  @override
  _sixCodeState createState() => _sixCodeState();
}

class _sixCodeState extends State<sixCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 28.0),
                      child: Text("Message Sent, check your email",style: TextStyle(
                        color: Colors.blueAccent,
                      ),),
                    ),
                    myCode(
                      keybType: TextInputType.numberWithOptions(decimal: true),
                      onChange: (value){
                        globals.sixCodeNb = value;
                      },
                    ),

                    myErrorText(errorText: errCode, color: colErrCode),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                          child: InkWell(
                            child: btn(btnText: 'Send'),
                            onTap: (){

                              _checkCode();
                            },
                          )),
                    ),
                  ],
                ),
              )]));
  }

  _sendCode() async {
    try{
      String? vCode;
      // vCode = globals.code1! + globals.code2! + globals.code3! +
      //     globals.code4! + globals.code5! + globals.code6!;
      var data = {
        'version': globals.version,
        'email'  : globals.email,
        'vCode'  : vCode
      };
      var res = await CallApi().postData(data, '(Control)getVCode.php');
      List<dynamic> body = json.decode(res.body);
      print(body[0]);
      if(body[0] == "success"){
        Navigator.pushNamedAndRemoveUntil(context, '/intro_page2', (route) => false);
      } else if (body[0] == "errorVersion") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                title: const Text('Error'),
                content: const Text("Your version: " + globals.version + "\n"+
                    globals.errorVersion),
                actions: <Widget>[
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
        );

      }else if (body[0] == "errorToken") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                title: const Text('Error'),
                content: const Text(
                    globals.errorToken),
                actions: <Widget>[
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      } else if (body[0] == "false") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Wrong Code !'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                globals.errorElse),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }


    }catch(e){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              globals.errorException),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );

    }}

  _checkCode() async{
    errCode = '';
    try {
      var data = {
        'code': globals.sixCodeNb,
      };

      var res = await CallApi().postData(
          data, 'Registration/Model/(Model)registMail.inc.php');
      print(res);
      print(res.body);
      List<dynamic> body = json.decode(res.body);

      if(body[0] == "success"){
        Navigator.pushNamed(context, '/Login');
      }else if(body[0] == "codeFailed"){
        setState(() {
          errCode = globals.codeFailed;
          colErrCode = globals.red_1;
        });
      }


    }catch(e){
      errCode = globals.errorException;
      colErrCode = globals.red_1;
    }
  }

}