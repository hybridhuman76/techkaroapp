import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/main.dart';
import 'package:techkaroapp/screen/members.dart';
import 'package:techkaroapp/screen/policy.dart';
import 'package:techkaroapp/screen/utility.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

String name = "", newflat = "";
bool islight, isSmall = false;

class _AccountState extends State<Account> {
  void toggleMode(bool value) {
    if (islight == false) {
      AdaptiveTheme.of(context).setDark();
      islight = true;
    } else {
      AdaptiveTheme.of(context).setLight();
      islight = false;
    }
  }

  void toggleFont(bool value2) {
    if (isSmall == true) {
      // font comes to normal
      setState(() {
        isSmall = false;
        vs = 12.0;
        m = 15.0;
        l = 20.0;
        vl = 25.0;
      });
    } else {
      setState(() {
        isSmall = true;
        vs = 15.0;
        m = 20.0;
        l = 25.0;
        vl = 30.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      child: Center(
                          child: Icon(Icons.arrow_upward, color: Colors.white)),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.bottomLeft, Alignment.topRight),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Members()));
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            child: Image.asset(
                              "assets/fam.png",
                              height: 80,
                              width: 80,
                            ),
                            padding: EdgeInsets.all(20),
                          ),
                          Text(
                            "${names.length}",
                            style: commonstyle(2 * vl, FontWeight.normal),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "View/Edit\nMembers",
                          style: commonstyle(l, FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    gradient: lineardesign(
                        Alignment.centerRight, Alignment.centerLeft),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      child: Image.asset(
                        "assets/home.png",
                        height: 50,
                        width: 50,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$flat",
                          style: commonstyle(2 * m, FontWeight.bold),
                        ),
                        Text(
                          line1[0],
                          style: commonstyle(l, FontWeight.normal),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              line1[1],
                              style: commonstyle(l - 5, FontWeight.normal),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: MaterialButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Edit Address"),
                                            content: Container(
                                              height: 150,
                                              child: Column(
                                                children: <Widget>[
                                                  TextField(
                                                    onChanged: (value) {
                                                      newflat = value;
                                                    },
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Enter New Flat Number"),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // title: Text("Error"),
                                            // content: Text(err.message),
                                            // content:
                                            //     Text("Invalid content, try again!"),
                                            actions: [
                                              TextButton(
                                                child: Text("Change"),
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser.uid)
                                                      .update({
                                                    'flat': "$newflat"
                                                  }).then((_) => Navigator.pop(
                                                          context));
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: Text("Edit"),
                                  color: Colors.red[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
                width: double.infinity,
                height: (vs + 1) * 10,
                decoration: BoxDecoration(
                  gradient:
                      lineardesign(Alignment.centerRight, Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Container(
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  crossAxisCount: 2,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebView(
                                      initialUrl: 'https://techkaro.in',
                                      javascriptMode:
                                          JavascriptMode.unrestricted,
                                    )));
                      },
                      child: cont(Image.asset("assets/logo.png", height: 40),
                          "About Us"),
                    ),
                    InkWell(
                      child: cont(Image.asset("assets/bill.png", height: 40),
                          "Utility Bills"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Utility()));
                      },
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: InkWell(
                      child: Container(
                        child: Center(
                          child: Text("Privacy Policy",
                              style: TextStyle(
                                  fontSize: vs + 3,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        height: 45,
                        width: (w / 2) - 20,
                        decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.centerRight, Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Policy()));
                      },
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        auth.signOut().then((res) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                              (Route<dynamic> route) => false);
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text("logOut",
                              style: TextStyle(
                                  fontSize: vs + 3,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        height: 45,
                        width: (w / 2) - 20,
                        decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.centerRight, Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Transform.scale(
                          scale: 2,
                          child: Switch(
                            value: islight,
                            onChanged: toggleMode,
                            inactiveThumbColor: Colors.blueAccent,
                          )),
                    ),
                    Text("switch mode"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Transform.scale(
                          scale: 2,
                          child: Switch(
                            activeColor: Colors.green,
                            value: isSmall,
                            onChanged: toggleFont,
                            inactiveThumbColor: Colors.blueAccent,
                          )),
                    ),
                    Text("change Font Size"),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
