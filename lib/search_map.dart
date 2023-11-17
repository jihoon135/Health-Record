import 'dart:math';

import 'package:flutter/material.dart';

import 'package:health_record/login.dart';
import 'package:health_record/test.dart';

import 'package:health_record/test.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:rive/rive.dart';

void main() async {
  runApp(const Search_Map());
}

class Search_Map extends StatefulWidget {
  const Search_Map({super.key});

  @override
  State<Search_Map> createState() => _Search_MapState();
}

class _Search_MapState extends State<Search_Map> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: Scaffold(body: KakaoMap()),
      home: Scaffold(),
    );
  }
}
