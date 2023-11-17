import 'package:flutter/material.dart';
import 'package:health_record/date.dart';
import 'package:health_record/health_routine.dart';
import 'package:health_record/info.dart';
import 'package:health_record/search_map.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: const TabBarView(
            children: [Search_Map(), //Health_Routine(), Date()],
          ),
          extendBodyBehindAppBar: true, // add this line

          bottomNavigationBar: Container(
            color: Colors.black, //색상
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
                    icon: Icon(
                      Icons.search,
                    ),
                    text: '헬스장 검색하기',
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: '운동 루틴',
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
