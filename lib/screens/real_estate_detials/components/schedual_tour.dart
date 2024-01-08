import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maskkn/models/profile.dart';
import 'package:maskkn/network-services/profile.dart';
import 'package:maskkn/network-services/schedualtour.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleTourView extends StatefulWidget {
  int id;
  ScheduleTourView({required this.id, Key? key}) : super(key: key);

  @override
  State<ScheduleTourView> createState() => _ScheduleTourViewState();
}

class _ScheduleTourViewState extends State<ScheduleTourView> {
  bool isProcessing = false;
  Profile? profile;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TextEditingController fromTime = TextEditingController();

  void _fetchProfileData() async {
    try {
      Profile profileData = await ProfileApi().getUserInfo();
      setState(() {
        profile = profileData;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    _fetchProfileData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String localeCode = Localizations.localeOf(context).languageCode;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0.8,
                        color: Colors.grey[200]!)
                  ]),
              child: TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(const Duration(days: 1000)),
                focusedDay: _focusedDay,
                calendarFormat: CalendarFormat.month,
                weekNumbersVisible: false,
                pageAnimationEnabled: true,
                headerStyle: const HeaderStyle(
                    formatButtonShowsNext: false, formatButtonVisible: false),
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    print('focusedDay ::  ,, focusedDay :: $_focusedDay');
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xff6b3d00)),
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0, 0),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                controller: fromTime,
                //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 8,
                        end: 14,
                      ),
                      child: Icon(
                        Icons.timer_outlined,
                      ),
                    ), //icon of text field
                    labelText: localeCode == 'ar'
                        ? "ادخل الوقت"
                        : "Enter the time" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    setState(() {
                      print(fromTime.text);

                      fromTime.text =
                          selectedTime.format(context).split(' ').first;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              child: ElevatedButton(
                  onPressed: () async {
                    if (fromTime.text.isNotEmpty) {
                      print(
                          'data sent 0:: ${profile?.name} ,, ${profile?.phone} ,,${_focusedDay.year}-${_focusedDay.month}-${_focusedDay.day} ,, ${fromTime.text.trim()} ,, ${widget.id}');
                      var req = await SchedualTour().sentSchedualTourr(
                        profile?.name ?? '',
                        profile?.phone.toString() ?? '',
                        _selectedDay == null
                            ? '${_focusedDay.year}-${_focusedDay.month}-${_focusedDay.day}'
                            : '${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day}',
                        fromTime.text.trim(),
                        widget.id,
                      );
                      var jsonData = json.decode(req.body);
                      print(req.request);
                      print(jsonData);
                      print(req.body);
                      print(req.statusCode);
                      print(req.headers);
                      print(
                          'data sent 1 :: ${profile?.name} ,, ${profile?.phone} ,, ${_selectedDay} <<< ${_focusedDay.year}-${_focusedDay.month}-${_focusedDay.day} ,, ${fromTime.text.trim()}');
                      if (req.statusCode == 200) {
                        setState(() {
                          isProcessing = false;
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Schedual Tour Added Successfully!')),
                        );
                      } else {
                        print(
                            'data sent 3 :: ${profile?.name} ,, ${profile?.phone} ,, ${_selectedDay!.year}-${_selectedDay!.month}-${_selectedDay!.day} ,, ${fromTime.text.trim()}');
                        print(req.request);
                        print(jsonData);
                        print(req.body);
                        print(req.statusCode);
                        print(req.headers);

                        setState(() {
                          isProcessing = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(jsonData['description'])),
                        );
                      }
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: Center(
                    child: Text(
                      isProcessing
                          ? localeCode == 'ar'
                              ? 'تحميل...'
                              : 'Loding...'
                          : localeCode == 'ar'
                              ? 'تاكيد'
                              : 'Confirm',
                      style: TextStyle(fontSize: 17),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget timePicker(String time, bool enabled, {bool selected = false}) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
            color: selected
                ? Theme.of(context).primaryColor
                : enabled
                    ? Colors.grey[300]!
                    : const Color.fromARGB(255, 188, 210, 220)),
        borderRadius: BorderRadius.circular(5),
        color: selected
            ? Theme.of(context).primaryColor
            : enabled
                ? Theme.of(context).scaffoldBackgroundColor
                : const Color.fromARGB(255, 188, 210, 220),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Center(
          child: Text(
        time,
        style: TextStyle(
            color: selected
                ? Theme.of(context).scaffoldBackgroundColor
                : enabled
                    ? Colors.black
                    : Colors.grey),
      )),
    );
  }
}
