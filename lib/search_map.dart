import 'dart:async';
import 'dart:developer' show log;
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class Search_Map extends StatefulWidget {
  const Search_Map({super.key});

  @override
  State<Search_Map> createState() => TestPageState();
}

class TestPageState extends State<Search_Map> {
  String? latitude;
  String? longitude;

  ///위치 권한 허용 여부 묻기

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    // 현재 화면의 크기 및 픽셀 비율을 계산합니다.
    return Scaffold(
      backgroundColor: const Color(0xFF343945),
      body: Center(
        child: NaverMap(
          // 네이버 지도의 옵션을 설정합니다.
          options: const NaverMapViewOptions(
            indoorEnable: true, // 실내 지도 활성화 여부
            locationButtonEnable: true, // 현재 위치 버튼 활성화 여부
            consumeSymbolTapEvents: true, // 심볼 탭 이벤트 소비 여부
          ),

          ///지도 생성과 함께 실행되는 코드 지정 가능
          onMapReady: (controller) {
            final marker = NMarker(
              //마커 데이터 저장
              id: 'test',
              position: const NLatLng(
                36.335778216981815,
                127.45637008651588,
              ),
            ); //위도와 경도 이용
            final marker1 = NMarker(
              id: 'test1',
              position: const NLatLng(
                36.33648253730799,
                127.45363416274779,
              ),
            );

            controller.addOverlayAll(
              {
                marker,
                marker1,
              },
            ); //마커 한 번에 복수 생성

            ///마커에 정보 띄우기
            final onMarkerInfoWindow =
                NInfoWindow.onMarker(id: marker.info.id, text: "드림캐슬");
            final onMarkerInfoWindow2 =
                NInfoWindow.onMarker(id: marker1.info.id, text: "우송대학교");
            marker.openInfoWindow(onMarkerInfoWindow);
            marker1.openInfoWindow(onMarkerInfoWindow2);
          },
          // 지도가 준비되면 호출되는 콜백 함수입니다.
        ),
      ),
    );
  }
}
