//로그인 창 화면이다
<<<<<<< HEAD
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_record/home_screen.dart';
import 'package:health_record/search_map.dart';
import 'package:health_record/text_field.dart';
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
>>>>>>> seongyeon
import 'package:health_record/join.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

<<<<<<< HEAD
showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16,
  );
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //firebase를 사용하기 위해 최초로 불러와야 하는 플러터 코어 엔진)(초기화 메서드(비동기방식)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
=======
import 'firebase_options.dart';
import 'package:health_record/text_field.dart';

void main() async {
>>>>>>> seongyeon
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
<<<<<<< HEAD
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool isInput = true;
  bool isSingIn = true;
  //로그인하기
  signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print(value);
        if (value.user!.emailVerified) {
          setState(() {
            isInput = false;
          });
        } else {
          showToast('emailVerified error');
        }
        return value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('user-not-found');
      } else if (e.code == 'wrong-password') {
        showToast('wrong-password');
      } else {
        print(e.code);
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isInput = true;
    });
  }

  //이메일/비밀번호 방식으로 회원가입하기
  signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user!.email != null) {
          FirebaseAuth.instance.currentUser?.sendEmailVerification();
          setState(() {
            isInput = false;
          });
        }
        return value;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('weak-password');
      } else if (e.code == 'email-already-in-use') {
        showToast('email-already-in-use');
      } else {
        showToast('other error');
        print(e.code);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<Widget> getInputWidget() {
    return [
      Text(
        isSingIn ? "SignIn" : "SignUp",
        style: const TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'email'),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter email';
                }
                return null;
              },
              onSaved: (String? value) {
                email = value ?? "";
              },
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'password',
              ),
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter password';
                }
                return null;
              },
              onSaved: (String? value) {
                password = value ?? "";
              },
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            _formKey.currentState?.save();
            print('email: $email, password: $password');
            if (isSingIn) {
              signIn();
            } else {
              signUp();
            }
          }
        },
        child: Text(
          isSingIn ? "SignIn" : "SignUp",
        ),
      ),
      RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
              text: 'Go',
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                    text: isSingIn ? "SignUp" : "SignIn",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isSingIn = !isSingIn;
                        });
                      }),
              ]))
    ];
  }

  List<Widget> getResultWidget() {
    String resultEmail = FirebaseAuth.instance.currentUser!.email!;
    return [
      Text(
        isSingIn
            ? "$resultEmail로 로그인 했습니다"
            : "$resultEmail로 회원가입 하셨습니다! 이메일 인증을 거쳐야 로그인이 가능합니다",
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
      ),
      ElevatedButton(
        onPressed: () {
          if (isSingIn) {
            signOut();
          } else {
            setState(() {
              isInput = true;
              isSingIn = true;
            });
          }
        },
        child: Text(isSingIn ? "SignOut" : "SignIn"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AUTH TEST'),
=======
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
>>>>>>> seongyeon
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: isInput ? getInputWidget() : getResultWidget()),
    );
  }
}

//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.black,
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           backgroundColor: Colors.black,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   'images/splash_screen_remove_background.png',
//                   width: 200,
//                   height: 200,
//                 ),
//               ),
//               Text_Field(
//                 controller: _controller1,
//                 labelText: 'E-mail',
//                 hintText: 'E-mail',
//                 obscureText: false,
//                 keyboardType: TextInputType.emailAddress,
//                 prefixIcon: const Icon(
//                   Icons.mail,
//                 ),
//               ),
//               SizedBox(
//                 height: (MediaQuery.sizeOf(context)).height / 50,
//               ),
//               Text_Field(
//                 controller: _controller2,
//                 labelText: '비밀번호',
//                 hintText: '비밀번호',
//                 obscureText: true,
//                 keyboardType: TextInputType.text,
//                 prefixIcon: const Icon(
//                   Icons.lock,
//                 ),
//               ),
//               SizedBox(
//                 height: (MediaQuery.sizeOf(context)).height / 30,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const Home_Screen()),
//                       (route) => false);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   minimumSize: const Size(335, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   '로그인',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: (MediaQuery.sizeOf(context)).height / 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     '계정이 없으신가요?',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w300,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     width: (MediaQuery.sizeOf(context)).width / 50,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/');
//                     },
//                     child: const Text(
//                       '가입하기',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
