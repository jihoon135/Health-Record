import 'dart:async';
import 'dart:developer' show log;
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class Search_Map extends StatefulWidget {
  const Search_Map({super.key});

  @override
  State<Search_Map> createState() => TestPageState();
}

class TestPageState extends State<Search_Map> {
  late NaverMapController _mapController;
  final Completer<NaverMapController> mapControllerCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final pixelRatio = mediaQuery.devicePixelRatio;
    final mapSize =
        Size(mediaQuery.size.width - 32, mediaQuery.size.height - 72);
    final physicalSize =
        Size(mapSize.width * pixelRatio, mapSize.height * pixelRatio);

    print("physicalSize: $physicalSize");

    return Scaffold(
      backgroundColor: const Color(0xFF343945),
      body: Center(
        child: SizedBox(
          width: mapSize.width,
          height: mapSize.height,
          child: NaverMap(
            options: const NaverMapViewOptions(
              indoorEnable: true,
              locationButtonEnable: false,
              consumeSymbolTapEvents: false,
            ),
            onMapReady: (controller) async {
              _mapController = controller;
              mapControllerCompleter.complete(controller);
              log("onMapReady", name: "onMapReady");
            },
          ),
        ),
      ),
    );
  }
}
