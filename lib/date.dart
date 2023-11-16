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
  final TextEditingController _eventController = TextEditingController();
  final Map<DateTime, List<dynamic>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2023), // 시작 년도
                  lastDay: DateTime(2100), // 마지막 년도
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = DateTime(
                          selectedDay.year, selectedDay.month, selectedDay.day);
                    });
                    _showAddDialog();
                  },
                  eventLoader: (day) {
                    return _events[day] ?? [];
                  },
                ),
                if (_selectedDay != null && _events[_selectedDay] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._events[_selectedDay]!
                          .map((event) => ListTile(
                                title: Text(event),
                              ))
                          .toList(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('일정 추가'),
        content: TextField(
          controller: _eventController,
          decoration: const InputDecoration(labelText: '일정 내용'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              if (_eventController.text.isNotEmpty && _selectedDay != null) {
                setState(() {
                  _events[_selectedDay!] ??= [];
                  _events[_selectedDay!]!.add(_eventController.text);
                  _eventController.clear();
                });
              }
              Navigator.pop(context);
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );
  }
}
