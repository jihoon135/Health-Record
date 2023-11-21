import 'package:flutter/material.dart';
import 'package:health_record/health_routine.dart';

void main() {
  runApp(const Routine_Option());
}

class Routine_Option extends StatefulWidget {
  const Routine_Option({super.key});

  @override
  State<Routine_Option> createState() => _Routine_OptionState();
}

class _Routine_OptionState extends State<Routine_Option> {
  var health_list = [
    '데드리프트',
    '벤치 프레스',
    '인클라인 벤치 프레스',
    '케이블 플라이 크로스오버',
    '체스트 프레스',
    '딥스',
    '체스트 플라이',
    '렛 풀 다운',
    '친 업',
    '풀 업',
    '시티 드로우',
    '암 풀 다운',
    '바벨로우',
    '프론트 레이즈',
    '사이드 레터럴 레이즈',
    '벤트오버 레터럴 레이즈',
    '밀리터리 프레스',
    '이두 컬',
    '푸쉬 다운',
    '리스트 컬',
    '레그 프레스',
    '스쿼트',
    '레그 익스텐션',
    '레그 컬',
  ];

  List<String> cartItems = []; //장바구니 정보임

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 500,
            child: ListView.builder(
                itemCount: health_list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
// 장바구니 추가, 제거
                        if (cartItems.contains(health_list[index])) {
                          cartItems.remove(health_list[index]);
                        } else {
                          cartItems.add(health_list[index]);
                        }
                      });
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.mail,
                        color: Color.fromRGBO(150, 110, 13, 100),
                      ),
                      title: Text(health_list[index]),
// 선택된 항목 강조
                      tileColor: cartItems.contains(health_list[index])
                          ? Colors.grey.withOpacity(0.3)
                          : null,
                    ),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Health_Routine(cartItems1: cartItems)));
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
