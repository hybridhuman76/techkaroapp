import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

Map<String, bool> serviceslist;
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
                    serviceslist = Map.from(value.data()['services']);
                  })
                }
            });

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
                    Text("Services",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "Grocery: " + checkIfRequested(serviceslist['grocery']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "AC Service: " + checkIfRequested(serviceslist['ac']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Painter: " + checkIfRequested(serviceslist['painter']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "RO Service: " + checkIfRequested(serviceslist['ro']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Water Supply: " +
                          checkIfRequested(serviceslist['water']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Pest Control: " + checkIfRequested(serviceslist['pest']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Plumber: " + checkIfRequested(serviceslist['plumber']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Electrician: " +
                          checkIfRequested(serviceslist['electrician']),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
                            title: Text("Request for Grocery?"),

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
                                      "services.grocery": true
                                    }).then((value) => {
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(society)
                                                  .update({
                                                "services":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    "req": "grocery",
                                                    "userid": FirebaseAuth
                                                        .instance
                                                        .currentUser
                                                        .uid
                                                        .toString()
                                                  }
                                                ])
                                              })
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
                                        .update({'services["ac"]': true}).then(
                                            (value) => {
                                                  FirebaseFirestore.instance
                                                      .collection("apartments")
                                                      .doc(society)
                                                      .update({
                                                    "services":
                                                        FieldValue.arrayUnion([
                                                      {
                                                        "req": "ac",
                                                        "userid": FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            .uid
                                                            .toString()
                                                      }
                                                    ])
                                                  })
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
                                      'services["painter"]': true
                                    }).then((value) => {
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(society)
                                                  .update({
                                                "services":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    "req": "painter",
                                                    "userid": FirebaseAuth
                                                        .instance
                                                        .currentUser
                                                        .uid
                                                        .toString()
                                                  }
                                                ])
                                              })
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
                                        .update({'services["ro"]': true}).then(
                                            (value) => {
                                                  FirebaseFirestore.instance
                                                      .collection("apartments")
                                                      .doc(society)
                                                      .update({
                                                    "services":
                                                        FieldValue.arrayUnion([
                                                      {
                                                        "req": "ro",
                                                        "userid": FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            .uid
                                                            .toString()
                                                      }
                                                    ])
                                                  })
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
                                      'services["water"]': true
                                    }).then((value) => {
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(society)
                                                  .update({
                                                "services":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    "req": "watersupply",
                                                    "userid": FirebaseAuth
                                                        .instance
                                                        .currentUser
                                                        .uid
                                                        .toString()
                                                  }
                                                ])
                                              })
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
                                      'services["pest"]': true
                                    }).then((value) => {
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(society)
                                                  .update({
                                                "services":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    "req": "pest control",
                                                    "userid": FirebaseAuth
                                                        .instance
                                                        .currentUser
                                                        .uid
                                                        .toString()
                                                  }
                                                ])
                                              })
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
                                      'services["plumber"]': true
                                    }).then((value) => {
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(society)
                                                  .update({
                                                "services":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    "req": "plumber",
                                                    "userid": FirebaseAuth
                                                        .instance
                                                        .currentUser
                                                        .uid
                                                        .toString()
                                                  }
                                                ])
                                              })
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
                                      'services["electrician"]': true
                                    }).then((value) => {
                                              FirebaseFirestore.instance
                                                  .collection("apartments")
                                                  .doc(society)
                                                  .update({
                                                "services":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    "req": "electrician",
                                                    "userid": FirebaseAuth
                                                        .instance
                                                        .currentUser
                                                        .uid
                                                        .toString()
                                                  }
                                                ])
                                              })
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

checkIfRequested(bool val) {
  if (val == false) {
    return "not requested";
  } else {
    return "requested";
  }
}
