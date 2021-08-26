import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/account.dart';
import 'package:techkaroapp/screen/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techkaroapp/screen/complaints.dart';
import 'package:techkaroapp/screen/notifications.dart';
import 'package:techkaroapp/screen/services.dart';
import 'package:techkaroapp/screen/visitors.dart';
import 'members.dart';
import 'chat.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String flat = "", name = "", role, society;
List<String> line1;
int billamount;
int complaint = 0;

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
            isSwitched = (value.data()["isout"]);
            flat = "${(value.data()["flat"])}";
            name = "${(value.data()["name"])}";
            names = List.from((value.data()["fam"]));
            society = "${(value.data()["society"])}";
            role = "${(value.data()["role"])}";
            billamount = (value.data()["bill"]);
            complaints = List.from((value.data()["complaints"]));
            notiflist = List.from((value.data()["notifications"]));
            visitors = List.from((value.data()["visitors"]));
          });
          // print('Document data: ${(value.data()["name"])}');
        } else {
          print('Document does not exist on the database');
        }
      }
    });
  }

  void y() {
    FirebaseFirestore.instance
        .collection('apartments')
        .doc('list')
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            // isSwitched = (value.data()["isout"]);
            // flat = "${(value.data()["flat"])}";
            line1 = List.from((value.data()[society]));
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
    y();
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
                  Row(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          child: Center(
                              child:
                                  Image.asset("assets/bell.png", height: 25)),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              gradient: lineardesign(
                                  Alignment.bottomLeft, Alignment.topRight),
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: InkWell(
                          child: Container(
                            child: Center(
                                child:
                                    Image.asset("assets/acc.png", height: 25)),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                gradient: lineardesign(
                                    Alignment.bottomLeft, Alignment.topRight),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Account()));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
                  child: Text(
                    "Hey, $name",
                    style:
                        TextStyle(fontSize: l + 5, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
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
                          line1[0],
                          style: commonstyle(l - 2, FontWeight.normal),
                        ),
                        Text(
                          line1[1],
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
                                "₹ $billamount",
                                style: commonstyle(2 * m, FontWeight.bold),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Pay Bill"),
                                          content: Container(
                                            height: 80,
                                            child: Row(
                                              children: <Widget>[
                                                Text("Call Admin to pay bill?")
                                              ],
                                            ),
                                          ),

                                          // title: Text("Error"),
                                          // content: Text(err.message),
                                          // content:
                                          //     Text("Invalid content, try again!"),
                                          actions: [
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  // String number =
                                                  //     .toString(); //set the number here

                                                  await FlutterPhoneDirectCaller
                                                      .callNumber(line1[2]);
                                                },
                                                child: Text("Call"))
                                          ],
                                        );
                                      });
                                },
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
                                "# ${complaints.length}",
                                style: commonstyle(2 * m, FontWeight.bold),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Complaint()));
                                },
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
                    InkWell(
                      child: cont(Image.asset("assets/chat.png", height: 40),
                          "Message"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Chat()));
                      },
                    ),
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
                    InkWell(
                      child: cont(Image.asset("assets/bill.png", height: 40),
                          "Billing"),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Pay Bill"),
                                content: Container(
                                  height: 80,
                                  child: Row(
                                    children: <Widget>[
                                      Text("Call Admin to pay bill?")
                                    ],
                                  ),
                                ),

                                // title: Text("Error"),
                                // content: Text(err.message),
                                // content:
                                //     Text("Invalid content, try again!"),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        const number =
                                            '08592119XXXX'; //set the number here

                                        await FlutterPhoneDirectCaller
                                            .callNumber(line1[2]);
                                      },
                                      child: Text("Call"))
                                ],
                              );
                            });
                      },
                    ),
                    InkWell(
                      child: cont(
                          Image.asset("assets/briefcase.png", height: 40),
                          "Visitors"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Visitors()));
                      },
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () async {
                  const number = '08592119XXXX'; //set the number here

                  await FlutterPhoneDirectCaller.callNumber(line1[3]);
                },
                child: Container(
                  height: 50,
                  // width: 300,
                  decoration: BoxDecoration(
                    gradient: lineardesign(
                        Alignment.centerRight, Alignment.centerLeft),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                      child: Text(
                    "Call at Society Gate",
                    style: commonstyle(m + 1, FontWeight.bold),
                  )),
                ),
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
