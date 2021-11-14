
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/globals/globals.dart';



class myRadioButton extends StatelessWidget {
  String text;
  var color;
  var color_1;
  var onPressed;

  myRadioButton({ required this.text, this.color, this.color_1, this.onPressed});

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20, fontFamily: 'Rubik', color: color_1
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}





























//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_client/globals/globals.dart' as globals;
//
// Color colContainer1 = globals.blue;
// Color colContainer2 = globals.blue;
//
// class myRadioButton extends StatefulWidget {
//   const myRadioButton({Key? key}) : super(key: key);
//
//   @override
//   _myRadioButtonState createState() => _myRadioButtonState();
// }
//
// class _myRadioButtonState extends State<myRadioButton> {
//
//   String radioItem = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//
//         Padding(
//           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 color: colContainer1,
//                 width: 120.0,
//                 child: RadioListTile(
//                   groupValue: radioItem,
//                   title: Text('Male',style: TextStyle(
//                     fontSize: 14.0
//                   ),),
//                   value: 'Male',
//                   onChanged: (val) {
//                     setState(() {
//                       radioItem = "Male";
//                     });
//                     globals.gender = radioItem;
//                   },
//                 ),
//               ),
//
//               Container(
//                 color: colContainer2,
//                 width: 142.0,
//                 child: RadioListTile(
//                   groupValue: radioItem,
//                   title: Text('Female',style: TextStyle(
//                     fontSize: 14.0
//                   ),),
//                   value: 'Female',
//                   onChanged: (val){
//                     setState(() {
//                       radioItem = "Female";
//                     });
//                     globals.gender = radioItem;
//                   },
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
//
// }