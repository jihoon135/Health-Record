import 'package:flutter/material.dart';
import 'package:health_record/routine_option.dart';

class Health_Routine extends StatefulWidget {
  const Health_Routine({Key? key}) : super(key: key);

  @override
  State<Health_Routine> createState() => _Health_RoutineState();
}

class _Health_RoutineState extends State<Health_Routine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        //루틴이 픽셀보다 커질 수 있으니까..
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.settings,
              size: 50,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Routine_Option()),
                    (route) => false); //루틴 옵션 정하는 곳으로 이동하기
              },
              child: const Text('설정하기'),
            ),
          ],
        ),
      ),
    ));
  }
}
