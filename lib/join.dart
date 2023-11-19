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

  String userEmail = '';
  String userPassword = '';
  String userName = '';
  String userPhone = '';
  String userPasswordCheck = '';
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('회원가입 완료!'),
          ),
        );
      }
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('오류입니다!'),
        ),
      );
    }
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
              child: Column(
                children: [
                  Image.asset(
                    'images/splash_screen_remove_background.png',
                    width: 200,
                    height: 200,
                  ),
                  Text_Form_Field(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '이름을 입력해주세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userName = value!;
                    },
                    onChanged: (value) {
                      userName = value;
                    },
                    key: const ValueKey(1),
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
                  Text_Form_Field(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '휴대폰 번호를 입력해주세요';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPhone = value!;
                    },
                    onChanged: (value) {
                      userPhone = value;
                    },
                    key: const ValueKey(2),
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
                  Text_Form_Field(
                      key: const ValueKey(3),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return '올바른 이메일 형식을 입력해주세요.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userEmail = value!;
                      },
                      onChanged: (value) {
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
                      userPassword = value;
                    },
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
                  Text_Form_Field(
                    key: const ValueKey(5),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return '최소 6글자 이상 입력하세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userPasswordCheck = value!;
                    },
                    onChanged: (value) {
                      userPasswordCheck = value;
                    },
                    labelText: '비밀번호를 재입력하세요.',
                    hintText: '비밀번호',
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.sizeOf(context)).height / 17,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      {
                        signUp();
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
