import 'package:flutter/material.dart';
import 'package:health_record/date.dart';
import 'package:health_record/health_routine.dart';
import 'package:health_record/info.dart';
import 'package:health_record/search_map.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

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
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Padding(
              padding: EdgeInsets.only(left: 35.0),
              child: Center(child: Text('Routine Mate')),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person),
                hoverColor: const Color.fromARGB(78, 255, 255, 255),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Info()),
                      (route) => false); //info로 이동하기
                },
              ),
            ],
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Health_Routine(
                cartItems1: const [],
              ),
              const Search_Map(),
              const Date()
            ],
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
