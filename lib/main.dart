import 'package:flutter/material.dart';
import 'package:techkaroapp/screen/login_signup.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(

    //   debugShowCheckedModeBanner: false,
    //   title: "TechKaroApp",
    //   home: Selection(),
    // );

    return AdaptiveTheme(
      light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.green),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          accentColor: Colors.green),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TechKaroApp",
        theme: theme,
        darkTheme: darkTheme,
        home: Selection(),
      ),
    );
  }
}

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
