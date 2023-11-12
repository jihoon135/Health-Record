import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime(2023), //시작 년도
            lastDay: DateTime(2100), //마지막 년도
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                // 날짜에 맞는 데이터 코드 넣기, DB 정보를 가져와야 할 것 같은데?
              });
            },
          ),
        ),
      ),
    );
  }
}
