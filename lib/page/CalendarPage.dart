import 'package:flutter/material.dart';
import 'package:mn_consultant/globals/globals.dart' as globals;
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarPage extends StatefulWidget {
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
                      child: ListView(
                        children: [
                          SizedBox(height: 150),
                          Center(
                            child: Text(thisDate != null ? thisDate : ''),
                          ),
                          // Wrap(
                          //   alignment: WrapAlignment.center,
                          //   children: children;
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }

  void _test(DateTime date) {
    setState(() {
      thisDate = date.day.toString() +
          '  ' +
          date.month.toString() +
          '  ' +
          date.year.toString();
      _open(thisDate);
      print(thisDate);
    });
  }

  _back() {
    Navigator.pop(context);
  }
}
