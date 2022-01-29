import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:mn_consultant/widgets/textInput/myErrorText.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../api/my_api.dart';

String errSS = '';
Color colErrSS = Colors.transparent;

class CalendarPage extends StatefulWidget {
  List<String> imgsDB = [];
  List<Widget> imgs = [];

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  String? thisDate;
  var calendarController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarController = CleanCalendarController(
      initialDateSelected: DateTime.now(),
      minDate: DateTime.now().subtract(const Duration(days: 90)),
      maxDate: DateTime.now().add(const Duration(days: 90)),
      rangeMode: false,
      onDayTapped: (date) {
        _test(date);
      },
      onPreviousMinDateTapped: (date) {},
      onAfterMaxDateTapped: (date) {},
      weekdayStart: DateTime.monday,
      // endDateSelected: DateTime(2022, 2, 3),
    );
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
            'Calender',
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
              color: globals.whiteBlue,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.height * 0.5,
                  right: MediaQuery.of(context).size.height * 0.5,
                ),
                child: ScrollableCleanCalendar(
                  calendarController: calendarController,
                  layout: Layout.DEFAULT,
                  calendarCrossAxisSpacing: 4,
                  scrollController: ScrollController(
                    initialScrollOffset:
                        MediaQuery.of(context).size.height * 2.5,
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  _open(String? thisDate) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            color: globals.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                title: Icon(
                  Icons.keyboard_arrow_down,
                  size: 36,
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: globals.whiteBlue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: widget.imgs,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _test(DateTime date) async {
    String thisDay;
    String thisMonth;
    if (date.day < 10) {
      thisDay = '0' + date.day.toString();
    } else {
      thisDay = date.day.toString();
    }
    if (date.month < 10) {
      thisMonth = '0' + date.month.toString();
    } else {
      thisMonth = date.month.toString();
    }

    thisDate = date.year.toString() + '-' + thisMonth + '-' + thisDay;

    print(thisDate);

    await _getScreenshots();
    _open(thisDate);

  }

  _back() {
    Navigator.pop(context);
  }

  _getScreenshots() async {
    // widget.imgs.clear();
    // widget.imgsDB.clear();

    errSS = '';
    colErrSS = Colors.transparent;

    var data = {
      'version': globals.version,
      'date': thisDate,
      'contrat_Id': globals.contrat_Id
    };

    var res = await CallApi()
        .postData(data, 'Screenshot/Control/(Control)getScreenshotName.php');
    print(res);
    print(res.body);
    //print("pppppp");
    List<dynamic> body = json.decode(res.body);
    print(body);

    if (body[0] == "true") {
      for (int i = 0; i < body[1].length; i++) {
        widget.imgsDB.add(body[1][i]);
        print(body[1][i]);
        print(widget.imgsDB);
      }

      for (int i = 0; i < body[1].length; i++) {
        widget.imgs.add(
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    'https://kwikcode.net/moonlighters_php/ScreenShot_Uploads/${globals.contrat_Id}/${widget.imgsDB[i]}',
                  fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      }

    } else if (body[0] == "error10") {
      setState(() {
        errSS = globals.error10;
        colErrSS = Colors.red;
      });
    }
  }
}
