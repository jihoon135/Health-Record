import 'dart:async';
import 'dart:developer' show log;
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class Search_Map extends StatefulWidget {
  const Search_Map({super.key});

  @override
  State<Search_Map> createState() => TestPageState();
}

class TestPageState extends State<Search_Map> {
  Completer<NaverMapController> _mapController =
      Completer<NaverMapController>();

  final Completer<NaverMapController> mapControllerCompleter = Completer();

  ///위치 권한 허용 여부 묻기
  getGeoData() async {
    // 위치 권한 요청
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Future.error('현재 위치 권한이 없습니다');
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error('위치 권한이 거부 상태입니다.');
      }
    }
    locationData = await location.getLocation();
  }

  @override
  void initState() {
    super.initState();
    getGeoData();
  }

  @override
  Widget build(BuildContext context) {
    // 현재 화면의 크기 및 픽셀 비율을 계산합니다.
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
            // 네이버 지도의 옵션을 설정합니다.
            options: const NaverMapViewOptions(
              indoorEnable: true, // 실내 지도 활성화 여부
              locationButtonEnable: true, // 현재 위치 버튼 활성화 여부
              consumeSymbolTapEvents: true, // 심볼 탭 이벤트 소비 여부
            ),
            // 지도가 준비되면 호출되는 콜백 함수입니다.
            onMapReady: (controller) async {
              _mapController = controller as Completer<NaverMapController>;
              mapControllerCompleter.complete(controller);
              log("onMapReady", name: "onMapReady");
            },
          ),
        ),
      ),
    );
  }
}
