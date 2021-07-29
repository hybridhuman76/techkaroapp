import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/account.dart';
import 'package:techkaroapp/screen/login_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techkaroapp/screen/services.dart';
import 'members.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String flat = "", name = "";

class _HomeState extends State<Home> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'status set to outdoor';
      });
      firestoreInstance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update({'isout': true});
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'status set to indoor';
      });
      firestoreInstance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update({'isout': false});
    }
  }

  void x() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            // line2 = "${(value.data()["society"])}";
            // line3 = "${(value.data()["locality"])}";
            flat = "${(value.data()["flat"])}";
            name = "${(value.data()["name"])}";
            names = List.from((value.data()["fam"]));
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Hey, $name",
                      style: TextStyle(
                          fontSize: l + 5, fontWeight: FontWeight.w600),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      child: Center(
                          child: Image.asset("assets/acc.png", height: 25)),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          gradient: lineardesign(
                              Alignment.bottomLeft, Alignment.topRight),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Account()));
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Indoor",
                  style: TextStyle(fontSize: l, fontWeight: FontWeight.bold),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Transform.scale(
                      scale: 2,
                      child: Switch(
                        onChanged: toggleSwitch,
                        value: isSwitched,
                        activeColor: Colors.red,
                        activeTrackColor: Color.fromRGBO(241, 227, 227, 1),
                        inactiveThumbColor: Colors.green,
                        inactiveTrackColor: Color.fromRGBO(241, 227, 227, 1),
                      )),
                ]),
                Text(
                  "Outdoor",
                  style: TextStyle(fontSize: l, fontWeight: FontWeight.bold),
                ),
              ],
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
                          "Apartment Name",
                          style: commonstyle(l - 2, FontWeight.normal),
                        ),
                        Text(
                          "locality",
                          style: commonstyle(l - 2, FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  gradient:
                      lineardesign(Alignment.centerRight, Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(20.0),
                ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Bill overdue!",
                            style: commonstyle(l, FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "₹ 6920",
                                style: commonstyle(2 * m, FontWeight.bold),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Text("Pay"),
                                color: Colors.red[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              )
                            ],
                          )
                        ],
                      ),

                      height: 130,
                      width: 250,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "  Complaint",
                            style: commonstyle(l, FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "# 50",
                                style: commonstyle(2 * m, FontWeight.bold),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Text("Details"),
                                color: Colors.red[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      height: 130,
                      width: 250,
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
            Container(
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  crossAxisCount: 2,
                  children: <Widget>[
                    cont(Image.asset("assets/chat.png", height: 40), "Message"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Services()));
                      },
                      child: cont(Image.asset("assets/cart.png", height: 40),
                          "Services"),
                    ),
                    cont(Image.asset("assets/bill.png", height: 40), "Billing"),
                    cont(Image.asset("assets/briefcase.png", height: 40),
                        "Visitors"),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 50,
                // width: 300,
                decoration: BoxDecoration(
                  gradient:
                      lineardesign(Alignment.centerRight, Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: Text(
                  "Call at Society Gate",
                  style: commonstyle(m + 1, FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      )),
    );
  }
}

cont(icon, text) {
  return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
            gradient: lineardesign(Alignment.topRight, Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              Text(
                text,
                style: commonstyle(
                  l,
                  FontWeight.bold,
                ),
              )
            ],
          )));
}

commonstyle(fontsize, weight) {
  return TextStyle(fontSize: fontsize, fontWeight: weight, color: Colors.white);
}

lineardesign(start, end) {
  return LinearGradient(
    colors: [Colors.purple[800], Color.fromRGBO(64, 151, 179, 1)],
    begin: start,
    end: end,
  );
}
