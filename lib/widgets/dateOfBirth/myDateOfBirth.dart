import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


Color colDateOfBirth = globals.blue;
Color colDateOfBirth_1 = globals.blue_1;
Color colDateOfBirth_2 = globals.blue_2;

//String dateOfBirthText = '';

class myDateOfBirth extends StatefulWidget {
  const myDateOfBirth({Key? key}) : super(key: key);

  @override
  _myDateOfBirthState createState() => _myDateOfBirthState();
}

class _myDateOfBirthState extends State<myDateOfBirth> {
  DateTime _date = DateTime.now();
  //TextEditingController _datecontroller = new TextEditingController();

  var myFormat = DateFormat('yyyy-MM-dd');
  Future<Null?> _selectDate(BuildContext context) async{

    DateTime? _datePicker = await showDatePicker(
      context: context,
      firstDate: DateTime(1947),
      lastDate: DateTime(2022),
      initialDate: _date,
      initialDatePickerMode: DatePickerMode.year,
    );
    if (_datePicker != null && _datePicker != _date){
      setState(() {
        _date = _datePicker;
        print(_date.toString());


        globals.dateOfBirth = myFormat.format(_date);
        //dateOfBirthText = myFormat.format(_date);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      child: TextFormField(
        key: Key(globals.dateOfBirth.toString()),
        initialValue: globals.dateOfBirth,
        //controller: _datecontroller,
        cursorColor: colDateOfBirth_1,
        readOnly: true,
        onTap: (){
          setState(() {
            _selectDate(context);
          });
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colDateOfBirth),
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: colDateOfBirth,
          labelText: "Date of birth",
          labelStyle: TextStyle( color: colDateOfBirth_1),
          //hintText: ('${globals.dateOfBirth}'),
          hintStyle: TextStyle(
            color: colDateOfBirth_1,
            fontSize: 15.0,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colDateOfBirth, width: 2.0),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
