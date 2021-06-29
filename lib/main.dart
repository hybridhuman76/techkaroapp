import 'package:flutter/material.dart';
import 'package:techkaroapp/screen/login_signup.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      home: Selection(),
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
// LoginSignupScreen()

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    check() {
      if (FirebaseAuth.instance.currentUser != null) {
        return Home();
      } else {
        return LoginSignupScreen();
      }
    }

    return check();
  }
}
