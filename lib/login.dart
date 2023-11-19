//로그인 창 화면이다

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_record/join.dart';

import 'package:health_record/text_field.dart';

class login extends StatefulWidget {
  const login({super.key});
  @override
  State<StatefulWidget> createState() {
    return login_state();
  }
}

class login_state extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                controller: emailController,
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
                controller: passwordController,
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
                  onPressed: () async {
                    try {
                      // Firebase 로그인 처리
                      UserCredential userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: emailController.text, // 입력된 이메일
                        password: passwordController.text, // 입력된 비밀번호
                      );

                      // 로그인이 성공하면 다음 페이지로 이동
                      Navigator.pushNamed(context, '/home_screen');
                    } on FirebaseAuthException {
                      // 로그인 실패 시 에러 처리

                      Fluttertoast.showToast(
                        msg: '잘못된 정보입니다. 다시 입력해주세요.',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
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
