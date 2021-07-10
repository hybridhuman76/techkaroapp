import 'package:flutter/material.dart';
import 'package:techkaroapp/main.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

String flat = "", name = "", line2 = "", line3 = "";
bool islight = false;

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

  void x() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            line2 = "${(value.data()["al2"])}";
            line3 = "${(value.data()["al3"])}";
            flat = "${(value.data()["flat"])}";
          });
          // print('Document data: ${(value.data()["name"])}');
        } else {
          print('Document does not exist on the database');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    x();
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.amber.withOpacity(0.0),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.minimize),
                              Icon(
                                Icons.family_restroom,
                                size: 60,
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                          Text(
                            "Members",
                            style: commonstyle(20.0, FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "5",
                        style: commonstyle(28.0, FontWeight.w400),
                      ),
                      Icon(
                        Icons.family_restroom,
                        size: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "$line2",
                            style: commonstyle(22.0, FontWeight.w400),
                          ),
                          Text(
                            "$flat",
                            style: commonstyle(20.0, FontWeight.bold),
                          ),
                          Text("$line3",
                              style: commonstyle(22.0, FontWeight.w400)),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut().then((res) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.power_settings_new,
                              size: 40,
                            ),
                            Text(
                              "LOGOUT",
                              style: commonstyle(22.0, FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("light"),
                    Switch(value: islight, onChanged: toggleMode),
                    Text("dark")
                  ],
                ),
                Text("Mode")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
