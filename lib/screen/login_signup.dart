import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:techkaroapp/config/pallete.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;

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
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.fill)),
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
                child: Column(
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
              ))
        ],
      ),
    );
  }

  Widget builtTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            MaterialCommunityIcons.email_outline,
            color: Pallete.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: "User Name",
          hintStyle: TextStyle(
            fontSize: 14,
            color: Pallete.textColor1,
          ),
        ),
      ),
    );
  }
}
