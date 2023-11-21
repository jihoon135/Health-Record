//로그인 창 화면이다

import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, background: Colors.black),
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
              const Text_Form_Field(
                labelText: 'E-mail',
                hintText: 'Gmail 계정을 입력하세요',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.mail,
                ),
              ),
              SizedBox(
                height: (MediaQuery.sizeOf(context)).height / 50,
              ),
              const Text_Form_Field(
                labelText: '비밀번호',
                hintText: '6자 이상이면 돼요 :)',
                obscureText: true,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(
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
                      fontSize: 24,
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
                        color: Color.fromARGB(255, 224, 85, 87),
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
