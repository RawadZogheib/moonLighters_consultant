import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/popup/PopupProjectName.dart';
import 'package:mn_consultant/widgets/popup/projectDialog.dart';

class PlusProjectCard extends StatelessWidget {
  PlusProjectCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.blue.withOpacity(0.1),
      splashColor: Colors.blue.withOpacity(0.2),
      child: Container(
        height: 170,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: globals.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )),
        margin: const EdgeInsets.all(10),
        child: Text(
          "+",
          style: TextStyle(fontSize: 40, color: Colors.blueAccent),
        ),
      ),
      onTap: () {
        //_launchApp();
        showDialog(
            context: context,
            builder: (BuildContext context) => PopupProjectName());
      },
    );
  }
//_launchApp() {
// Process.run('ls',['-l']);
//}

}
