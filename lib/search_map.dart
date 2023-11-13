import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class Search_Map extends StatefulWidget {
  const Search_Map({super.key});

  @override
  State<Search_Map> createState() => _Search_MapState();
}

class _Search_MapState extends State<Search_Map> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: Column(
        children: [
          Text(
            '원하시는 위치를 검색해보세요!',
            style: TextStyle(fontSize: 0),
          ),
        ],
      ),
    )); //어려워보이네
  }
}

// https://pub.dev/packages/kakao_map_plugin 참고 요망
