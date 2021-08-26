import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/home.dart';

class Visitors extends StatefulWidget {
  @override
  _VisitorsState createState() => _VisitorsState();
}

List<Map> visitors = [];

class _VisitorsState extends State<Visitors> {
  visitorss(w) {
    if (visitors.length == 0) {
      return Center(
        child: Text("No visitors in the last 7 days!!"),
      );
    } else {
      return ListView.builder(
          itemCount: visitors.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: lineardesign(
                        Alignment.centerRight, Alignment.centerLeft),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        // color: Colors.orange,
                        width: w - 90,
                        child: Text(
                          visitors[index]['name'],
                          style: commonstyle(l, FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ));
            // return ListTile(
            //     leading: Icon(Icons.list),
            //     trailing: IconButton(icon: Icon(Icons.remove)),
            //     title: Text("List item $index"));
          });
    }
  }

  x() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    visitors = value.data()['visitors'];
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    x();

    return Scaffold(
      body: Container(
        child: visitorss(w),
      ),
    );
  }
}
