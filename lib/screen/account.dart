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
            SingleChildScrollView(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset("assets/acc.png"),
                          Text(
                            "Edit Members",
                            style: commonstyle(20, FontWeight.normal),
                          )
                        ],
                      ),
                      height: 130,
                      width: 150,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: lineardesign(
                            Alignment.centerRight, Alignment.centerLeft),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset("assets/acc.png"),
                          Row(
                            children: <Widget>[
                              Text(
                                "5",
                                style: commonstyle(40, FontWeight.normal),
                              ),
                              Text(
                                "View",
                                style: commonstyle(20, FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                      height: 130,
                      width: 170,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: lineardesign(
                            Alignment.centerRight, Alignment.centerLeft),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              scrollDirection: Axis.horizontal,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: 130,
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
                    cont(Icons.chat, "About Us"),
                    cont(Icons.supervised_user_circle_sharp, "Bills"),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        child: Switch(value: islight, onChanged: toggleMode),
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.centerRight, Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                        child: Switch(value: islight, onChanged: toggleMode),
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.centerRight, Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        child: Center(
                          child: Text("Notifications",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.centerRight, Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                          child: Container(
                            height: 45,
                            width: 160,
                            decoration: BoxDecoration(
                              gradient: lineardesign(
                                  Alignment.centerRight, Alignment.centerLeft),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}


// Row(
//                   children: <Widget>[
//                     Text("light"),
//                     Switch(value: islight, onChanged: toggleMode),
//                     Text("dark")
//                   ],
//                 ),