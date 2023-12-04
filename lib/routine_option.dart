import 'package:flutter/material.dart';

class Routine_Option extends StatefulWidget {
  final int containerIndex;
  final List<String> cartItems1;
  const Routine_Option(
      {super.key, required this.containerIndex, required this.cartItems1});

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

  late List<String> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cartItems1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(31, 74, 74, 74),
        body: Center(
          child: SizedBox(
            width: 500,
            child: ListView.builder(
                itemCount: health_list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      Map<String, String>? result =
                          await _showSetAndWeightDialog();
                      if (result != null) {
                        setState(() {
                          String item =
                              '${health_list[index]}: ${result['setCount']} 세트, ${result['weight']} kg';
                          if (cartItems.contains(item)) {
                            cartItems.remove(item);
                          } else {
                            cartItems.add(item);
                          }
                        });
                      }
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        health_list[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      tileColor: cartItems.any(
                              (item) => item.startsWith(health_list[index]))
                          ? Colors.grey.withOpacity(0.3)
                          : null,
                    ),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, cartItems);
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }

  Future<Map<String, String>?> _showSetAndWeightDialog() async {
    String? setCount;
    String? weight;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('세트 수와 무게를 입력하세요'),
          content: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: '세트 수'),
                onChanged: (value) {
                  setCount = value;
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: '무게 (kg)'),
                onChanged: (value) {
                  weight = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    return {'setCount': setCount ?? '', 'weight': weight ?? ''};
  }
}
