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
  geoGeoData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    geoGeoData();
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
          onMapReady: (controller) async {
            await geoGeoData();
            final marker = NMarker(
              //마커 데이터 저장
              id: 'D-GYM',
              position: const NLatLng(
                36.336078821642694,
                127.46023125536593,
              ),
            ); //위도와 경도 이용
            final marker1 = NMarker(
              id: '덕림',
              position: const NLatLng(
                36.328310698565,
                127.45434133230944,
              ),
            );
            final marker2 = NMarker(
              id: '피트니스1번지 대전대점',
              position: const NLatLng(
                36.331050334912774,
                127.46138226010666,
              ),
            );
            final marker3 = NMarker(
              id: '페르소나 헬스&PT 용운점',
              position: const NLatLng(
                36.327343242697765,
                127.45161827720767,
              ),
            );

            controller.addOverlayAll(
              {
                marker,
                marker1,
                marker2,
                marker3,
              },
            ); //마커 한 번에 복수 생성
            ///마커에 정보 띄우기
            final onMarkerInfoWindow =
                NInfoWindow.onMarker(id: marker.info.id, text: "D-GYM");
            final onMarkerInfoWindow2 =
                NInfoWindow.onMarker(id: marker1.info.id, text: "덕림헬스");
            final onMarkerInfoWindow3 =
                NInfoWindow.onMarker(id: marker2.info.id, text: "피트니스1번지 대전대점");
            final onMarkerInfoWindow4 = NInfoWindow.onMarker(
                id: marker3.info.id, text: "페르소나 헬스&PT 용운점");
            marker.openInfoWindow(onMarkerInfoWindow);
            marker1.openInfoWindow(onMarkerInfoWindow2);
            marker2.openInfoWindow(onMarkerInfoWindow3);
            marker3.openInfoWindow(onMarkerInfoWindow4);
          },
          // 지도가 준비되면 호출되는 콜백 함수입니다.
        ),
      ),
    );
  }
}
