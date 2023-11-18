//이 파일에서 처음 앱이 시작되며 각 routes를 설정
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:health_record/firebase_options.dart';
import 'package:health_record/health_routine.dart';
import 'package:health_record/home_screen.dart';
import 'package:health_record/info.dart';
import 'package:health_record/login.dart';
import 'package:health_record/join.dart';
import 'package:health_record/search_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // 추가

  await NaverMapSdk.instance.initialize(clientId: dotenv.env['naver_api_key']);
  WidgetsFlutterBinding
      .ensureInitialized(); //플러터에서 파이어베이스를 사용하기 위해 매인메소드 안에서 비동기방식을 사용하기 위해 사용하는 함수
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //위와 동일
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
        '/login': (context) => const login(),
        '/join': (context) => const join(),
        '/home_screen': (context) => const Home_Screen(),
        '/info': (context) => const Info(),
        '/Map': (context) => const Search_Map(),
        '/Health_Routine': (context) => Health_Routine(cartItems1: const [])
      },
    );
  }
}
