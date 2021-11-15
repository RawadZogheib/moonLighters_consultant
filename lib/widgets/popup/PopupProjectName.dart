
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/button/myButton.dart';
import 'package:mn_consultant/widgets/textInput/myTextInput.dart';


class PopupProjectName extends StatefulWidget {
  const PopupProjectName({Key? key}) : super(key: key);

  @override
  _PopupProjectNameState createState() => _PopupProjectNameState();
}

class _PopupProjectNameState extends State<PopupProjectName> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Column(
                  children: [

                    myTextInput
                      (
                      keybType: TextInputType.name,
                      onChange: (value){
                        globals.ProjectName = value;
                      },
                      textString:"Name of the File" ,
                      labelText: "gjmjug",
                      spaceAllowed: true,
                      obscure: false,
                    ),



                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                          child: InkWell(
                            child: myButton(btnText: 'Send',
                            height: 100,
                            width: 150,
                            //onPress: ,),

                          )),
                    ),
                ),


    ],
    ),
    ),
    ],
    ),
    );

  }
}
