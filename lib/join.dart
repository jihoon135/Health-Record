//회원가입 화면이다
import 'package:flutter/material.dart';
import 'package:health_record/login.dart';
import 'package:health_record/text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const join());
}

class join extends StatefulWidget {
  const join({super.key});
  @override
  State<StatefulWidget> createState() {
    return join_state();
  }
}

class join_state extends State<join> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

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
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'images/splash_screen_remove_background.png',
                    width: 200,
                    height: 200,
                  ),
                  Text_Field(
                    controller: _controller1,
                    labelText: '이름을 입력하세요.',
                    hintText: '이름',
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context)).height / 50,
                  ),
                  Text_Field(
                    controller: _controller2,
                    labelText: '휴대폰 번호를 입력하세요.',
                    hintText: '휴대폰 번호',
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(
                      Icons.phone_iphone,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context)).height / 50,
                  ),
                  Text_Field(
                      controller: _controller3,
                      labelText: 'E-mail 입력하세요.',
                      hintText: 'E-mail',
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                      )),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context)).height / 50,
                  ),
                  Text_Field(
                    controller: _controller4,
                    labelText: '비밀번호를 입력하세요.',
                    hintText: '비밀번호',
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context)).height / 50,
                  ),
                  Text_Field(
                    controller: _controller5,
                    labelText: '비밀번호를 재입력하세요.',
                    hintText: '비밀번호',
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context)).height / 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller1.text.isEmpty ||
                          _controller2.text.isEmpty ||
                          _controller3.text.isEmpty ||
                          _controller4.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "모든 항목을 입력해주세요!",
                          fontSize: 20,
                        );
                      } else if (_controller4.text != _controller5.text) {
                        Fluttertoast.showToast(
                          msg: "비밀번호가 일치하지 않습니다!",
                          fontSize: 20,
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const login()),
                            (route) => false);
                      }
                    },
                    child: const Text(
                      '회원가입 완료',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
