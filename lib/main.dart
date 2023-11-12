//이 파일에서 처음 앱이 시작되며 각 routes를 설정
import 'package:flutter/material.dart';
import 'package:health_record/home_screen.dart';
import 'package:health_record/info.dart';
import 'package:health_record/splash_screen.dart';
import 'package:health_record/login.dart';
import 'package:health_record/join.dart';

void main() {
  runApp(const Route_management());
}

///각 화면들의 route 정보를 담아낼 클래스이다
class Route_management extends StatelessWidget {
  const Route_management({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, background: Colors.black),
      ),
      home: const Scaffold(
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/Splash_Screen': (context) => const SplashScreen(),
        '/login': (context) => const login(),
        '/join': (context) => const join(),
        '/home_screen': (context) => const Home_Screen(),
        '/info': (context) => const Info(),
      },
    );
  }
}
