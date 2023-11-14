import 'package:flutter/material.dart';
import 'package:health_record/routine_option.dart';

class Health_Routine extends StatefulWidget {
  List<String> cartItems1;
  Health_Routine({Key? key, required this.cartItems1}) : super(key: key);

  @override
  State<Health_Routine> createState() => _Health_RoutineState();
}

class _Health_RoutineState extends State<Health_Routine> {
  List<String> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.cartItems1.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.cartItems1[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //누르면
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Routine_Option(),
            ),
          ).then((result) {
            if (result != null && result is List<String>) {
              setState(() {
                widget.cartItems1.addAll(result);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
