import 'package:flutter/material.dart';
import 'package:health_record/date.dart';
import 'package:health_record/health_routine.dart';
import 'package:health_record/info.dart';
import 'package:health_record/search_map.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'dart:async';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class TimerDialog extends StatefulWidget {
  const TimerDialog({super.key});

  @override
  _TimerDialogState createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  int seconds = 0;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('타이머',
          style: TextStyle(
            color: Colors.white,
          )),
      content: Text('경과 시간: $seconds초',
          style: const TextStyle(
            color: Colors.white,
          )),
      actions: [
        TextButton(
          child: const Text('시작'),
          onPressed: () {
            timer?.cancel();
            timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              setState(() {
                seconds++;
              });
            });
          },
        ),
        TextButton(
          child: const Text('정지'),
          onPressed: () {
            timer?.cancel();
          },
        ),
        TextButton(
          child: const Text('초기화'),
          onPressed: () {
            timer?.cancel();
            setState(() {
              seconds = 0;
            });
          },
        ),
        TextButton(
          child: const Text('닫기'),
          onPressed: () {
            timer?.cancel();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4.8,
              ),
              child: const Center(
                  child: Text(
                'Routine Mate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                ),
              )),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.timer,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const TimerDialog(),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hoverColor: const Color.fromARGB(78, 255, 255, 255),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Info()),
                      (route) => false);
                },
              ),
            ],
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Health_Routine(
                cartItems1: [],
              ),
              Search_Map(),
              Date()
            ],
          ),
          extendBodyBehindAppBar: true,
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                indicatorWeight: 2,
                labelColor: Colors.red,
                unselectedLabelColor: Color.fromARGB(183, 255, 255, 255),
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: '운동 루틴',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.search,
                    ),
                    text: '헬스장 검색하기',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.calendar_today,
                    ),
                    text: '달력',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
