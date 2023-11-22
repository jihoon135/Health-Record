//회원가입 화면이다
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:health_record/login.dart';
import 'package:health_record/text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class join extends StatefulWidget {
  const join({super.key});
  @override
  State<StatefulWidget> createState() {
    return join_state();
  }
}

class join_state extends State<join> {
  final _authemtication = FirebaseAuth.instance; //파이어베이스 사용자 인증과 등록에 사용할 인스턴스
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController _editingController2 = TextEditingController();
  final TextEditingController _editingController3 = TextEditingController();
  final TextEditingController _editingController4 = TextEditingController();
  

  String userEmail = '';
  String userPassword = '';
  String userName = '';
  String userPhone = '';

  final _formkey = GlobalKey<FormState>();

  void _tryValidation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isValid = _formkey.currentState?.validate() ?? false;
      if (isValid) {
        _formkey.currentState?.save();
      }
    });
  }

  Future<void> signUp() async {
    _tryValidation();

    try {
      final newUser = await _authemtication.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);

      if (newUser.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const login();
            },
          ),
        );
        Fluttertoast.showToast(
          msg: '회원가입 완료!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 255, 178, 178),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } on FirebaseAuthException {}
  }

  Future<void> _navigateToLogin() async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const login()),
      (route) => false,
    );
  }

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
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Image.asset(
                      'images/splash_screen_remove_background.png',
                      width: 200,
                      height: 200,
                    ),
                    Text_Form_Field(
                      suffixIcon: const Icon(
                        Icons.clear,
                      ),
                      controller: _editingController,
                      key: const ValueKey(1),
                      labelText: '이름을 입력하세요 (선택)',
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
                    Text_Form_Field(
                      key: const ValueKey(2),
                      labelText: '휴대폰 번호를 입력하세요 (선택)',
                      hintText: '휴대폰 번호',
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(
                        Icons.phone_iphone,
                      ),
                      suffixIcon: const Icon(
                        Icons.clear,
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.sizeOf(context)).height / 50,
                    ),
                    Text_Form_Field(
                        key: const ValueKey(3),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return '올바른 이메일 형식을 입력해주세요.';
                          }
                          return null;
                        },
                        suffixIcon: const Icon(
                          Icons.clear,
                        ),
                        onSaved: (value) {
                          userEmail = value!;
                        },
                        onChanged: (value) {
                          setState(() {});
                          userEmail = value;
                        },
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
                    Text_Form_Field(
                      key: const ValueKey(4),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return '최소 6글자 이상 입력하세요.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userPassword = value!;
                      },
                      onChanged: (value) {
                        setState(() {});
                        userPassword = value;
                      },
                      suffixIcon: const Icon(
                        Icons.clear,
                      ),
                      labelText: '비밀번호를 입력하세요.',
                      hintText: '비밀번호',
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.sizeOf(context)).height / 7.5,
                    ),
                    SizedBox(
                      width: (MediaQuery.sizeOf(context)).width / 1.25,
                      height: (MediaQuery.sizeOf(context)).height / 13,
                      child: ElevatedButton(
                        onPressed: () {
                          {
                            signUp();
                          }
                        },
                        child: const Text(
                          '가입하기',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
