import 'package:flutter/material.dart';
import 'package:techkaroapp/screen/login_signup.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TechKaroApp",
      home: LoginSignupScreen(),
    );
  }
}

// class LoginSignupUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Login Signup UI",
//       home: LoginSignupScreen(),
//     );
//   }
// }
