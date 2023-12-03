import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Permission Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location Permission Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Check and Request Location Permission'),
          onPressed: () async {
            Location location = Location();

            bool serviceEnabled;
            PermissionStatus permissionGranted;

            serviceEnabled = await location.serviceEnabled();
            if (!serviceEnabled) {
              serviceEnabled = await location.requestService();
              if (!serviceEnabled) {
                return;
              }
            }

            permissionGranted = await location.hasPermission();
            if (permissionGranted == PermissionStatus.denied) {
              permissionGranted = await location.requestPermission();
              if (permissionGranted != PermissionStatus.granted) {
                return;
              }
            }
          },
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //----------------------------- 아래부터 추가 해야할 코드

  final _authemtication = FirebaseAuth.instance; //파이어베이스 사용자 인증과 등록에 사용할 인스턴스

  String userEmail = '';
  String userPassword = '';
  final _formkey = GlobalKey<FormState>();

  void _tryValidation() {
    final isValid = _formkey.currentState!.validate(); //!는 null이 아님을
    if (isValid) {
      _formkey.currentState!.save();
    }
  }

  void signUp() async {
    _tryValidation(); //validation 기능을 위함.

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
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('오류입니다!'),
        ),
      );
    }
  }

  //----------------------------- 여기까지 추가해야 할 코드

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 189, 255),
        title: const Text('회원가입 페이지'),
      ),
      body: Form(
        key: _formkey, //각 TextFormField를 구분하기 위해 Form에서 key를 지정 (추가사항)
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'e-mail',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 164),
                child: TextFormField(
                  //-----------------------------------------------------------아래부터 추가할 코드
                  key: const ValueKey(1),
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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'password',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                color: const Color.fromARGB(255, 255, 255, 164),
                child: TextFormField(
                  key: const ValueKey(2),
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

                  //-----------------------------------------------------------여기까지 추가할 코드
                ),
              ),
              const SizedBox(height: 100),
              OutlinedButton(
                onPressed: () {
                  signUp(); //회원가입 버튼이 눌렸을 때 signUp 함수를 불러온다.
                },
                child: const Text('회원가입! 😎'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
