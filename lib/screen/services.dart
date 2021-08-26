import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

List<bool> serviceslist = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];
final List<String> matchlist = [
  "grocery",
  "ac",
  "painter",
  "ro",
  "water",
  "pest",
  "plumber",
  "electrician"
];

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    serviceslist = List.from(value.data()['services']);
                  })
                }
            });
    String txt = "";
    for (int i = 1; i < 8; i++) {
      if (serviceslist[i] == true) {
        setState(() {
          txt = txt + matchlist[i] + "\n";
        });
      }
      if (txt == "") {
        setState(() {
          txt = "no pending requests";
        });
      }
    }
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
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
                      "Services",
                      style: TextStyle(
                          fontSize: l + 5, fontWeight: FontWeight.w600),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              width: w - 40,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("In progress",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      lineardesign(Alignment.topLeft, Alignment.bottomRight)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "Grocery"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for Electrician?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[0]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                ),
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "AC Service"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for AC Service?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[1]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "Painter"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for Painter?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[2]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                ),
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "RO Service"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for RO Service?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[3]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "Water Suplly"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for Water Supply?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[4]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                ),
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "Pest Control"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for Pest Control?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[5]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "Plumber"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for Plumber?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[6]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                ),
                InkWell(
                  child: servicescont(w, Icons.wifi_rounded, "Electrician"),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Request for Electrician?"),

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser.uid)
                                        .update({
                                      'services[7]': true,
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"))
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

servicescont(w, ic, title) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              ic,
              size: 50,
              color: Colors.blue,
            ),
            Text(
              "$title",
              style: TextStyle(fontSize: m),
            )
          ],
        ),
        width: (w / 2) - 60,
        height: (w / 2) - 60,
        // color: Colors.orange,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Colors.blueAccent, style: BorderStyle.solid, width: 4)),
      ));
}
