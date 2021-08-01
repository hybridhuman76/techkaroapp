import 'package:flutter/material.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String a = "ax", society;

class ChatCheck extends StatefulWidget {
  @override
  _ChatCheckState createState() => _ChatCheckState();
}

List<dynamic> text;
int numtext = 7;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final firestoreInstance = FirebaseFirestore.instance;

class _ChatCheckState extends State<ChatCheck> {
  void x() {
    FirebaseFirestore.instance
        .collection('apartments')
        .doc(society)
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            // line2 = "${(value.data()["society"])}";
            // line3 = "${(value.data()["locality"])}";

            text = List.from((value.data()["messages"]));
          });
          // print('Document data: ${(value.data()["name"])}');
        } else {
          print('Document does not exist on the database');
        }
      }
    });
  }

  String c;
  @override
  Widget build(BuildContext context) {
    x();
    // if (role == "member") {
    //   return ChatMember();
    // } else {
    //   return ChatAdmin();
    // }
    return ChatAdmin();
  }
}

class ChatMember extends StatefulWidget {
  @override
  _ChatMemberState createState() => _ChatMemberState();
}

class _ChatMemberState extends State<ChatMember> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.amber,
              child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: numtext,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                // color: Color.fromRGBO(3, 84, 102, 1),
                                // borderRadius: BorderRadius.circular(10.0),
                                ),
                            child: Container(
                              color: Colors.black.withOpacity(0.1),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "${text[index]['name']}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: w - 75,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                    "${text[index]['datetime']}\n\n${text[index]['content']}")),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )));
                  }),
              height: h - 70,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Text("You're not allowed to send messages"),
                    width: w - 50,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 30,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ChatAdmin extends StatefulWidget {
  @override
  _ChatAdminState createState() => _ChatAdminState();
}

class _ChatAdminState extends State<ChatAdmin> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.amber,
              child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: numtext,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Colors.blue,
                              // color: Color.fromRGBO(3, 84, 102, 1),
                              // borderRadius: BorderRadius.circular(10.0),
                              ),
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "${text[index]['name']}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: w - 75,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: Text(
                                                  "${text[index]['datetime']}\n\n${text[index]['content']}")),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ));
                  }),
              height: h - 70,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: "type your message"),
                    ),
                    width: w - 50,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 30,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
