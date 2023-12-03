import 'package:flutter/material.dart';
import 'package:health_record/routine_option.dart';

class Health_Routine extends StatefulWidget {
  final List<List<String>> cartItems1;
  const Health_Routine({super.key, required this.cartItems1});

  @override
  State<Health_Routine> createState() => _Health_RoutineState();
}

class _Health_RoutineState extends State<Health_Routine> {
  late List<List<String>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.generate(5, (index) => []); // 가변 리스트 변환
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.pink[200],
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Routine ${index + 1}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        ...cartItems[index].map((item) =>
                            Text(item)), // cartItems의 각 항목에 대한 텍스트 위젯 생성
                      ],
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Routine_Option(
                                containerIndex: index,
                                cartItems1: cartItems[index]),
                          ),
                        ).then((result) {
                          if (result != null && result is List<String>) {
                            setState(() {
                              cartItems[index] = result;
                            });
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          cartItems[index].clear(); //지우기
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
