//로그인 창 화면이다
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_record/join.dart';

import 'firebase_options.dart';
import 'package:health_record/text_field.dart';

void main() async {
  runApp(const login());
}

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<StatefulWidget> createState() {
    return login_state();
  }
}

class login_state extends State<login> {
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/splash_screen_remove_background.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Text_Form_Field(
                controller: _controller5,
                labelText: 'E-mail',
                hintText: 'E-mail',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.mail,
                ),
              ),
              SizedBox(
                height: (MediaQuery.sizeOf(context)).height / 50,
              ),
              Text_Form_Field(
                controller: _controller6,
                labelText: '비밀번호',
                hintText: '비밀번호',
                obscureText: true,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.lock,
                ),
              ),
              SizedBox(
                height: (MediaQuery.sizeOf(context)).height / 30,
              ),
              SizedBox(
                width: (MediaQuery.sizeOf(context)).width / 1.25,
                height: (MediaQuery.sizeOf(context)).height / 13,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (MediaQuery.sizeOf(context)).height / 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '계정이 없으신가요?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.sizeOf(context)).width / 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const join();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      '가입하기',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
