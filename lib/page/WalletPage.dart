import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;

class WalletPage extends StatefulWidget {
  double balance = 4700; // Get from server
  List<Widget> children = <Widget>[];
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              _back();
            }),
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Wallet',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 35,
          ),
          Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: globals.whiteBlue,
                  child: Column(
                    //SingleChildScrollView to solve pixel overflowed error
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        //Balance
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: globals.blue,
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your Balance:",
                              style: TextStyle(fontSize: 14, color: globals.blue_1),
                            ),
                            Text(
                              "\$ " + widget.balance.toStringAsFixed(2),
                              style: TextStyle(fontSize: 32, color: globals.blue_1),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Transaction History',
                          style: TextStyle(fontSize: 20, color: globals.blue_1),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: Colors.grey.shade900,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: ListView(
                            children: widget.children,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  _back() {
    Navigator.pop(context);
  }

  _loadPage() {
    timer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      print("30sec gone!!");
      if (mounted) {
        print("30sec gone,and _loadChildrenOnline!!");
        _checkBalance();
      }
    });
  }

  _checkBalance() async {

  }
}
