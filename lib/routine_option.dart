import 'package:flutter/material.dart';

class Routine_Option extends StatefulWidget {
  const Routine_Option({super.key});

  @override
  State<Routine_Option> createState() => _Routine_OptionState();
}

class _Routine_OptionState extends State<Routine_Option> {
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Health_Routine(cartItems1: cartItems)),
                (route) => false);
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
