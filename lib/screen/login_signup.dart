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
    _mob = "";

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
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
                      "Signup to Continue",
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
                  height: 380,
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
                          Container(
                            child: Text("Login"),
                          ),
                          Container(
                            child: Text("Signup"),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            child: builtTextField(Icon(Icons.email), "Email ID",
                                false, true, _email),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: builtTextField(Icon(Icons.password),
                                "Password", true, false, _password),
                          ),
                          MaterialButton(
                              child: Text("Login"),
                              onPressed: () async {
                                await firebaseAuth
                                    .signInWithEmailAndPassword(
                                        email: _email, password: _password)
                                    .then((result) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
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
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(
                                Icon(Icons.account_circle_outlined),
                                "Full Name",
                                false,
                                false,
                                "_name"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(
                                Icon(Icons.account_circle_outlined),
                                "Mobile Number",
                                false,
                                false,
                                "_mob"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(
                                Icon(Icons.account_circle_outlined),
                                "Flat Number",
                                false,
                                false,
                                "_flat"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(
                                Icon(Icons.account_circle_outlined),
                                "Address Line 2",
                                false,
                                false,
                                "_al2"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(
                                Icon(Icons.account_circle_outlined),
                                "Address Line 3",
                                false,
                                false,
                                "_al3"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(Icon(Icons.email), "Email ID",
                                false, true, "_email"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: builtTextField(Icon(Icons.password),
                                "Password", true, false, "_password"),
                          ),
                          MaterialButton(
                            child: Text("Create Account"),
                            onPressed: () async {
                              await firebaseAuth
                                  .createUserWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((value) {
                                if (value.user != null) {
                                  firestoreInstance
                                      .collection("users")
                                      .doc(value.user?.uid)
                                      .set({
                                    "name": _name,
                                    "mob": _mob,
                                    "email": _email,
                                    "al2": _al2,
                                    "al3": _al3,
                                    "flat": _flat,
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
                      ),
                    ],
                  ))))
        ],
      ),
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

/*
 Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen
                                      ? Pallete.textColor1
                                      : Pallete.activeColor,
                                ),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text("SIGNUP",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSignupScreen
                                              ? Pallete.activeColor
                                              : Pallete.activeColor,
                                        )),
                                    if (isSignupScreen)
                                      Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.orange,
                                      ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSignupScreen = true;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Column(
                          children: [
                            builtTextField(
                                MaterialCommunityIcons.account_outline,
                                "User Name",
                                false,
                                false),
                            builtTextField(MaterialCommunityIcons.email_outline,
                                "email", false, true),
                            builtTextField(MaterialCommunityIcons.lock_outline,
                                "password", true, false),
                            Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                ),
                                child: Row(children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = true;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          margin: EdgeInsets.only(right: 8),
                                          decoration: BoxDecoration(
                                              color: isMale
                                                  ? Pallete.textColor2
                                                  : Colors.transparent,
                                              border: Border.all(
                                                  width: 1,
                                                  color: isMale
                                                      ? Colors.transparent
                                                      : Pallete.textColor2),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Icon(
                                            MaterialCommunityIcons
                                                .account_outline,
                                            color: isMale
                                                ? Colors.white
                                                : Pallete.iconColor,
                                          ),
                                        ),
                                        Text(
                                          "Male",
                                          style: TextStyle(
                                              color: Pallete.textColor1),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isMale = false;
                                      });
                                    },
                                    child: Row(children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        margin: EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                            color: isMale
                                                ? Colors.transparent
                                                : Pallete.textColor2,
                                            border: Border.all(
                                                width: 1,
                                                color: isMale
                                                    ? Colors.transparent
                                                    : Pallete.textColor1),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(
                                          MaterialCommunityIcons
                                              .account_outline,
                                          color: isMale
                                              ? Colors.transparent
                                              : Colors.white,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(color: Pallete.textColor1),
                                  )
                                ]))
                          ],
                        ))
                  ],
                ),
                */
