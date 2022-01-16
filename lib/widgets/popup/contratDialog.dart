import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/button/myButton.dart';
import 'package:mn_consultant/widgets/popup/errorAlertDialog.dart';
import 'package:mn_consultant/widgets/textInput/myTextInput.dart';
import 'package:sizer/sizer.dart';

class ContratDialog extends StatefulWidget {
  @override
  State<ContratDialog> createState() => _ContratDialogState();
}

class _ContratDialogState extends State<ContratDialog> {
  Color coli_contratName = globals.blue;
  Color coli_1_contratName = globals.blue_1;
  Color coli_2_contratName = globals.blue_2;

  //Contrat price colors
  Color coli_contratPrice = globals.blue;
  Color coli_1_contratPrice = globals.blue_1;
  Color coli_2_contratPrice = globals.blue_2;

  //Contrat max payment colors
  Color coli_contratMaxPrice = globals.blue;
  Color coli_1_contratMaxPrice = globals.blue_1;
  Color coli_2_contratMaxPrice = globals.blue_2;

  @override
  Widget build(BuildContext context) {
    //Contrat name colors

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
      content: Container(
        height: 31.6.h, //300
        width: 44.1.w, //400
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10.0, bottom: 12.0),
              child: Text(
                "Contrat",
                style: TextStyle(fontSize: 26, color: globals.blue_1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myTextInput(
                  textString: "Enter Your Contrat Name",
                  labelText: 'Contrat Name',
                  colBlue: coli_contratName,
                  colBlue_1: coli_1_contratName,
                  colBlue_2: coli_2_contratName,
                  spaceAllowed: false,
                  obscure: false,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    globals.contrat_name = value;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myTextInput(
                  textString: "Enter Your Contrat Price (\$USD/Hour)",
                  labelText: 'Price',
                  colBlue: coli_contratPrice,
                  colBlue_1: coli_1_contratPrice,
                  colBlue_2: coli_2_contratPrice,
                  spaceAllowed: false,
                  obscure: false,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    globals.contrat_dollar_per_hour = value;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myTextInput(
                  textString: "Enter Your Max Payment (In \$USD)",
                  labelText: 'Max Payment',
                  colBlue: coli_contratMaxPrice,
                  colBlue_1: coli_1_contratMaxPrice,
                  colBlue_2: coli_2_contratMaxPrice,
                  spaceAllowed: false,
                  obscure: false,
                  textInputAction: TextInputAction.next,
                  onChange: (value) {
                    globals.contrat_max_payment = value;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: myTextInput(
                  textString: "Enter A Description",
                  labelText: 'Description (Optional)',
                  colBlue: globals.blue,
                  colBlue_1: globals.blue_1,
                  colBlue_2: globals.blue_2,
                  spaceAllowed: true,
                  obscure: false,
                  maxLines: 5,
                  onChange: (value) {
                    globals.contrat_description = value;
                  }),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(left: 170),
              child: myButton(
                  btnText: "Submit",
                  onPress: () {
                    //print("Submitted");
                    bool isEmpty = false;
                    //contrat_name
                    if (globals.contrat_name != null &&
                        globals.contrat_name != '') {
                      setState(() {
                        coli_contratName = globals.blue;
                        coli_1_contratName = globals.blue_1;
                        coli_2_contratName = globals.blue_2;
                      });
                    } else {
                      isEmpty = true;
                      setState(() {
                        coli_contratName = globals.red;
                        coli_1_contratName = globals.red_1;
                        coli_2_contratName = globals.red_2;
                      });
                    }

                    //contrat_dollar_per_hour
                    if (globals.contrat_dollar_per_hour != null &&
                        globals.contrat_dollar_per_hour != '') {
                      setState(() {
                        coli_contratPrice = globals.blue;
                        coli_1_contratPrice = globals.blue_1;
                        coli_2_contratPrice = globals.blue_2;
                      });
                    } else {
                      isEmpty = true;
                      setState(() {
                        coli_contratPrice = globals.red;
                        coli_1_contratPrice = globals.red_1;
                        coli_2_contratPrice = globals.red_2;
                      });
                    }

                    //contrat_max_payment
                    if (globals.contrat_max_payment != null &&
                        globals.contrat_max_payment != '') {
                      setState(() {
                        coli_contratMaxPrice = globals.blue;
                        coli_1_contratMaxPrice = globals.blue_1;
                        coli_2_contratMaxPrice = globals.blue_2;
                      });
                    } else {
                      isEmpty = true;
                      setState(() {
                        coli_contratMaxPrice = globals.red;
                        coli_1_contratMaxPrice = globals.red_1;
                        coli_2_contratMaxPrice = globals.red_2;
                      });
                    }

                    if (isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              ErrorAlertDialog(message: globals.error1));
                    } else {
                      //success
                      _sendRequestContrat();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
  _sendRequestContrat(){


  }
}
