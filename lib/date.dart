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
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
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
        height: MediaQuery.of(context).size.height * 0.7,
        child: Scaffold(
          backgroundColor: Colors.grey[800],
          body: Column(
            children: [
              Container(
                color: Colors.grey[800],
                child: TableCalendar(
                  headerStyle: const HeaderStyle(
                    titleTextStyle:
                        TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2023),
                  lastDay: DateTime(2099),
                  // 선택한 날짜에 마커 표시
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(color: Colors.white),
                    weekendTextStyle: TextStyle(color: Colors.red),
                    holidayTextStyle: TextStyle(color: Colors.green),
                    // 선택한 날짜에 동그라미 마커 색상 변경
                    selectedDecoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    // 이벤트 마커 색상 변경
                    markerDecoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      _eventController.text =
                          _events[_selectedDay]?.join('') ?? '';
                    });
                    _showAddDialog();
                  },
                  eventLoader: (day) {
                    return _events[day] ?? [];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('헬스 기록'),
        content: TextField(
          controller: _eventController,
          decoration: const InputDecoration(labelText: '내용'),
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
              if (_eventController.text.isNotEmpty) {
                setState(() {
                  _events[_selectedDay] = _eventController.text.split('');
                });
                await _saveEvents();
              }
              Navigator.pop(context);
            },
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }
}
