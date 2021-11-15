import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/popup/contratDialog.dart';

class PlusContratCard extends StatelessWidget {
  var onTap;

  PlusContratCard({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.blue.withOpacity(0.1),
      splashColor: Colors.blue.withOpacity(0.2),
      child: Container(
        height: 170,
        width: 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: globals.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        margin: const EdgeInsets.only(top:12, bottom: 12,left: 30, right: 30),
        child: Text(
          "+",
          style: TextStyle(fontSize: 40, color: Colors.blueAccent),
        ),
      ),
      onTap: () {
        onTap();
        showDialog(
            context: context,
            builder: (BuildContext context) => ContratDialog()).then((exit) {
          globals.contrat_Id = null;
          globals.contrat_name = null;
          globals.contrat_dollar_per_hour = null;
          globals.contrat_max_payment = null;
          globals.contrat_description = null;
          globals.contrat_code = null;
        });
      },
    );
  }
}
