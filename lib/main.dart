import 'package:flutter/material.dart';
import 'package:mn_consultant/page/FirstPage.dart';
import 'package:mn_consultant/page/Login.dart';
import 'package:mn_consultant/page/Registration.dart';
import 'package:mn_consultant/page/contrat.dart';
import 'package:mn_consultant/page/project.dart';
import 'package:mn_consultant/widgets/Code/sixCode.dart';
import 'package:sizer/sizer.dart';

void main() {
  debugShowCheckedModeBanner: false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: FirstPage(),
          initialRoute: '/FirstPage',
          routes: {
            '/Login': (context) => login(),
            '/Registration': (context) => registration(),
            '/Contrat': (context) => contrat(),
            '/Project': (context) => Project(),
            '/FirstPage': (context) => FirstPage(),
            '/sixCode': (context)=>sixCode(),
          });
     });
  }
  }
