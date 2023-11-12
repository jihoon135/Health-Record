//회원가입 화면이다
import 'package:flutter/material.dart';
import 'package:health_record/login.dart';
import 'package:health_record/text_field.dart';
void main() {
  runApp(const join());
}

class join extends StatefulWidget {
  const join({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return join_state();
  }
}

class join_state extends State<join> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Colors.black,
        ),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 250,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text_Field(labelText: '이름을 입력하세요.', hintText: '이름'),
                const Text_Field(
                    labelText: '휴대폰 번호를 입력하세요.', hintText: '휴대폰 번호'),
                const Text_Field(
                    labelText: 'E-mail 입력하세요.', hintText: 'E-mail'),
                const Text_Field(
                  labelText: '비밀번호를 입력하세요.',
                  hintText: '비밀번호',
                ),
                const Text_Field(labelText: '비밀번호를 재입력하세요.', hintText: '비밀번호'),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),
                        (route) => false);
                  },
                  child: const Text(
                    '회원가입 완료',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
