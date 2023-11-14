import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:health_record/login.dart';
import 'package:health_record/test.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:health_record/test.dart';

void main() async {
  // try {
  //   // 비동기로 초기화 작업을 진행
  //   await dotenv.load();
  //   await FlutterConfig.loadEnvVariables();

  //   runApp(const Search_Map());
  // } catch (e) {
  //   print('Error loading .env file: $e');
  // }
  runApp(const Search_Map());
}

class Search_Map extends StatelessWidget {
  const Search_Map({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(body: KakaoMap()),
      home: Scaffold(
        body: Text('d'),
      ),
    );
  }
}
