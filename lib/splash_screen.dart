//인트로 화면에 대한 파일이다
import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      routes: {
        // '/watcha': (context) => const Watcha(), // Watcha 페이지로 이동하는 route 설정
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1), // 1초 동안 인트로 화면 표시
      () => Navigator.pushReplacementNamed(context,
          '/login'), // Watcha 페이지로 이동 (intro 화면이기 때문에 pushreplacementnamed 사용)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/디스코드 인트로 사진.jpg'), // 인트로 이미지 표시
      ),
    );
  }
}
