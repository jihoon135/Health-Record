import 'package:flutter/material.dart';
import 'package:health_record/routine_option.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Health_Routine extends StatefulWidget {
  final List<List<String>> cartItems1;
  const Health_Routine({super.key, required this.cartItems1});

  @override
  State<Health_Routine> createState() => _Health_RoutineState();
}

class _Health_RoutineState extends State<Health_Routine> {
  List<List<String>>? cartItems;

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  void loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('cartItems');
    if (data != null) {
      var decodedData = json.decode(data) as List;
      cartItems = decodedData
          .map<List<String>>((item) => List<String>.from(item))
          .toList();
    } else {
      cartItems = List.generate(5, (index) => []); // 가변 리스트 변환
    }
    setState(() {});
  }

  void saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cartItems', json.encode(cartItems));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return cartItems != null
        ? Scaffold(
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
                              ...cartItems![index]
                                  .map((item) => SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          item,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      )),
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
                                      cartItems1: cartItems![index]),
                                ),
                              ).then((result) {
                                if (result != null && result is List<String>) {
                                  setState(() {
                                    cartItems![index] = result;
                                    saveCartItems(); // 데이터 저장
                                  });
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                cartItems![index].clear(); //지우기
                                saveCartItems(); // 데이터 저장
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
          )
        : const CircularProgressIndicator(); // 데이터가 로드되는 동안에는 로딩 인디케이터를 보여줍니다.
  }
}
