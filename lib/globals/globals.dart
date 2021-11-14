library mnconsultant.globals;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mn_consultant/hexColor/hexColor.dart';

//Version
const String version = "v1.0";

//Server Ip  (page[/my_api.dart])
const String myIP = "http://147.78.45.13/";


//Colors
final Color blue = Colors.blue.shade50;
final Color blue_1 = Colors.blue.shade900;
final Color blue_2 = Colors.blue.shade900.withOpacity(0.5);
final Color red = Colors.red.shade50;
final Color red_1 = Colors.red.shade900;
final Color red_2 = Colors.red.shade900.withOpacity(0.5);
final Color transparent = Colors.transparent;
final Color black = Colors.black;
final Color whiteBlue = HexColor("#f2f3f8");
final Color white = HexColor("#fdfdfd");

//Errors
const String error1 = "No Spaces Allowed.";
const String error2_1 = "Your username must contain at least 8 characters.";
const String error2_2 = "Your username can only contain lowercase and uppercase characters and special characters( _ .).";
const String error2_3 = "Your password must contain at least 8 characters, 1 lowercase(a-z),1 uppercase(A-Z),1 numeric character(0-9) and 1 special character(* . ! @ # \$ % ^ & : , ? _ -).";
//const String error2_4 = "Your age must be greater than 17.";
const String error2_5 = "It's not an email format.";
//const String error2_6 = "It's not a university email.";
const String error2_7 = "phone Number already exists";
const String error3 = "Please make sure your passwords match.";
const String error4 = "Cannot connect to the dataBase.";
const String error5 = "UserName already exist.";
const String error6 = "Email already exist.";
const String error7 = "Field cannot be empty.";
const String error8 = "Incorrect email or password.";       // for login
const String error9 = "It's not a phoneNumber format, example: +961########";
const String error10 = "No data available";
const String errorToken = "Token Error.";
const String errorVersion = "New version available.";
const String errorElse = "Failed to connect... Connection Problem.";
const String errorException = "OOPs! Something went wrong. Try again in few seconds.";
const String codeFailed = "your code is incorrect";

//for 6 digit code
String? sixCodeNb = null;

//Registration  (page[/signup.dart /registration.dart /registration2.dart /registration3.dart])
String? Id = null;
String? email = null;
String? fName = null;
String? lName = null;
String? password = null;
String? repassword = null;
String? gender = null;
String? phoneNumber = null;
String? userName = null;
String? dateOfBirth = null;


//login  (page[/login.dart /login2.dart])
String? emailLogin = null;
String? passwordLogin = null;


//Contrat (page[/contrat])
String? contrat_Id = null;
String? contrat_name = null;
String? contrat_dollar_per_hour = null;
String? contrat_max_payment = null;
String? contrat_description = null;
String? contrat_code = null;

String? ProjectName = null;

/*
  print(globals.contrat_Id.toString() + " " +
  globals.contrat_name.toString() + " " +
  globals.contrat_dollar_per_hour.toString() + " " +
  globals.contrat_max_payment.toString() + " " +
  globals.contrat_description.toString() + " " +
  globals.contrat_code.toString());

*/