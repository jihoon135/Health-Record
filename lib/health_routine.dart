import 'package:flutter/material.dart';
import 'package:health_record/routine_option.dart';

class Health_Routine extends StatefulWidget {
  final List<String> cartItems1;
  const Health_Routine({super.key, required this.cartItems1});

  @override
  State<Health_Routine> createState() => _Health_RoutineState();
}

class _Health_RoutineState extends State<Health_Routine> {
  late List<String> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = List.from(widget.cartItems1); // 가변 리스트 변환
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.pink[200],
              ),
              child: ListTile(
                title: Text('루틴 ${index + 1}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Routine_Option(),
                          ),
                        ).then((result) {
                          if (result != null && result is List<String>) {
                            setState(() {
                              cartItems.addAll(result);
                            });
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          cartItems.clear(); //지우기
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
