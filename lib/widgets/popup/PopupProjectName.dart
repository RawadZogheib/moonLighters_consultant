import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/button/myButton.dart';
import 'package:mn_consultant/widgets/button/submitButton.dart';
import 'package:mn_consultant/widgets/popup/contratDialog.dart';
import 'package:mn_consultant/widgets/textInput/myTextInput.dart';

Color colProjectName = globals.blue; //projectName
Color colProjectName_1 = globals.blue_1;
Color colProjectName_2 = globals.blue_2;

class PopupProjectName extends StatefulWidget {
  const PopupProjectName({Key? key}) : super(key: key);

  @override
  _PopupProjectNameState createState() => _PopupProjectNameState();
}

class _PopupProjectNameState extends State<PopupProjectName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Column(
                children: [
                  myTextInput(
                    textString: "Name of the project",
                    labelText: 'Name of your New Project',
                    colBlue: colProjectName,
                    colBlue_1: colProjectName_1,
                    colBlue_2: colProjectName_2,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    spaceAllowed: false,
                    obscure:false,
                    onChange: (value) {
                      globals.ProjectName = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                        child: InkWell(
                          child: submitButton(submitBtnText: 'Submit'),
                          //onTap: null,),

                        )),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
