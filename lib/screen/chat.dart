import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

final databaseRef =
    FirebaseDatabase.instance.reference(); //database reference object

void addData(String data) {
  databaseRef.push().set({'name': data, 'comment': 'A good season'});
  databaseRef.child('arw52noida').update({});
}

List<Map> messages = [
  {
    'name': 'aakash',
    'datetime': '26 August, 2:34 pm',
    'content': 'hey im aakash'
  },
  {'name': 'arpit', 'datetime': '26 Auguekekke pm', 'content': 'hey im aakash'},
  {
    'name': 'palash',
    'datetime': '26 August, 2:34 pm',
    'content': 'hey dkdkkdkdkash'
  },
  {
    'name': 'pintu',
    'datetime': '26 August, 2:35 pm',
    'content': 'hey im pintu lol'
  },
  // {
  //   'name': 'aayush',
  //   'datetime': '26 August, 2:34 pm',
  //   'content': 'hey im aakash'
  // },
  // {
  //   'name': 'aakash',
  //   'datetime': '26 Ahhhhhh, 2:34 pm',
  //   'content': 'hey im aakash'
  // }
];

class _ChatState extends State<Chat> {
  message(w) {
    return ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.amber,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(messages[index]['name'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                      Text(messages[index]['datetime'])
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(messages[index]['content']))
                ],
              )));
        });
  }

// final DatabaseReference db = FirebaseDatabase(app: app).reference();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(height: h - 50, child: message(w)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: w - 80,
                child: TextField(
                    decoration: InputDecoration(hintText: "Type here")),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
              ),
            ],
          )
        ],
      )),
    );
  }
}
