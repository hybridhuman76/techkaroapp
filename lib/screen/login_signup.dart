import 'package:flutter/material.dart';
import 'package:techkaroapp/config/pallete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techkaroapp/screen/home.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

String _email = "",
    _password = "",
    _al2 = "",
    _al3 = "",
    _flat = "",
    _name = "",
    _mob = "",
    email = "",
    password = "";

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  Color enabled = Colors.white;
  Color disabled = Colors.grey.withOpacity(0.2);
  double signupelevation = 0;
  // double loginelevation = 5;
  double loginelevationn = 5;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Welcome to",
                      style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700]),
                      children: [
                        TextSpan(
                          text: "TechKaro,",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[700],
                          ),
                        )
                      ],
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Register/Login to Continue",
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 200,
              child: Container(
                  height: h - 230,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5),
                      ]),
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          MaterialButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  loginelevationn = 5;
                                  signupelevation = 0;
                                });
                              },
                              elevation: loginelevationn,
                              height: 50,
                              minWidth:
                                  (MediaQuery.of(context).size.width - 80) / 2,
                              child: Text(
                                "LogIn",
                                style: TextStyle(color: Colors.black),
                              ),
                              color: enabled),
                          MaterialButton(
                            splashColor: Colors.transparent,
                            elevation: signupelevation,
                            onPressed: () {
                              setState(() {
                                loginelevationn = 0;
                                signupelevation = 5;
                              });
                            },
                            height: 50,
                            minWidth:
                                (MediaQuery.of(context).size.width - 80) / 2,
                            child: Text("Signup",
                                style: TextStyle(color: Colors.black)),
                            color: enabled,
                          ),
                        ],
                      ),
                      funcdecide(loginelevationn)
                    ],
                  ))))
        ],
      ),
    );
  }

  login(firebaseAuth, context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.textColor1),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.textColor1),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Email ID",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Pallete.textColor1,
                  ),
                ),
                onChanged: (text) {
                  email = text;
                },
              ),
            )),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.textColor1),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Pallete.textColor1),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Pallete.textColor1,
                  ),
                ),
                onChanged: (text) {
                  password = text;
                },
              ),
            )),
        MaterialButton(
            child: Text("Login", style: TextStyle(color: Colors.black)),
            onPressed: () async {
              await firebaseAuth
                  .signInWithEmailAndPassword(email: email, password: password)
                  .then((result) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }).catchError((err) {
                print(err.message);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text(err.message),
                        actions: [
                          TextButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              });
            }),
      ],
    );
  }

  funcdecide(lognielevation) {
    if (lognielevation == 5) {
      return login(firebaseAuth, context);
    } else {
      return signup(firebaseAuth, context);
    }
  }

  signup(firebaseAuth, context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(Icon(Icons.account_circle_outlined),
              "Full Name", false, false, "_name"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(
              Icon(Icons.phone), "Mobile Number", false, false, "_mob"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(
              Icon(Icons.home), "Flat Number", false, false, "_flat"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(
              Icon(Icons.home), "Address Line 2", false, false, "_al2"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(
              Icon(Icons.home), "Address Line 3", false, false, "_al3"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(
              Icon(Icons.email), "Email ID", false, true, "_email"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: builtTextField(
              Icon(Icons.lock), "Password", true, false, "_password"),
        ),
        MaterialButton(
          child: Text("Create Account", style: TextStyle(color: Colors.black)),
          onPressed: () async {
            await firebaseAuth
                .createUserWithEmailAndPassword(
                    email: _email, password: _password)
                .then((value) {
              if (value.user != null) {
                firestoreInstance.collection("users").doc(value.user?.uid).set({
                  "name": _name,
                  "mob": _mob,
                  "email": _email,
                  "al2": _al2,
                  "al3": _al3,
                  "flat": _flat,
                  "isout": false,
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              }
            }).catchError((err) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(err.message),
                      // content:
                      //     Text("Invalid content, try again!"),
                      actions: [
                        TextButton(
                          child: Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            });
          },
        ),
      ],
    );
  }

  Widget builtTextField(
      // _email, _password, _al2, _al3, _flat, _name, _mob
      Icon icon,
      String hintText,
      bool isPassword,
      bool isEmail,
      change) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        cursorColor: Colors.black,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Pallete.textColor1,
          ),
        ),
        onChanged: (text) {
          if (change == "_email") {
            _email = text;
          } else if (change == "_password") {
            _password = text;
          } else if (change == "_al2") {
            _al2 = text;
          } else if (change == "_al3") {
            _al3 = text;
          } else if (change == "_flat") {
            _flat = text;
          } else if (change == "_mob") {
            _mob = text;
          }
        },
      ),
    );
  }
}
