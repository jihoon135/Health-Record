import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final TextEditingController _eventController = TextEditingController();
  Map<DateTime, List<dynamic>> _events = {};

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedEvents = prefs.getString('events');
    if (storedEvents != null) {
      final decodedData = Map<DateTime, dynamic>.from(
          decodeMap(json.decode(storedEvents) as Map<String, dynamic>));
      _events = decodedData
          .map((key, value) => MapEntry(key, List<String>.from(value)));
    }
  }

  Future<void> _saveEvents() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('events', json.encode(encodeMap(_events)));
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    return map.map((key, value) {
      return MapEntry(key.toIso8601String(), value);
    });
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    return map.map((key, value) {
      return MapEntry(DateTime.parse(key), value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2023), // 변경 가능
                  lastDay: DateTime(2099), // 변경 가능
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
                      ..._events[_selectedDay]!.map((event) => ListTile(
                            title: Text(event),
                          )),
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
            onPressed: () async {
              // 함수를 비동기로 변경
              if (_eventController.text.isNotEmpty && _selectedDay != null) {
                setState(() {
                  _events[_selectedDay!] ??= [];
                  _events[_selectedDay!]!.add(_eventController.text);
                  _eventController.clear();
                });
                await _saveEvents(); // 일정 추가 후 _saveEvents() 호출
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


// 1. 새로운 입력을 받으면 그 입력값으로 갱신 되도록 해야겠고
// 2. 달력에 이벤트를 좀 넣을 수 있으면 좋겠다.. 
// 3. 달력 테마 다른거 있나? 찾아보기(어두운색)