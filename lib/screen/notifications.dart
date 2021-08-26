import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/home.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

List<String> notiflist;

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    notifs(w) {
      if (notiflist == null) {
        return Center(
          child: Text("you have no new notifcations in the past 7 days"),
        );
      } else {
        return ListView.builder(
            itemCount: notiflist.length,
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
                      child: Padding(
                        child: Text(
                          notiflist[index],
                          style: commonstyle(l, FontWeight.normal),
                        ),
                        padding: EdgeInsets.all(10),
                      )));
              // return ListTile(
              //     leading: Icon(Icons.list),
              //     trailing: IconButton(icon: Icon(Icons.remove)),
              //     title: Text("List item $index"));
            });
      }
    }

    return Scaffold(
      body: Container(
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
            Container(
              child: notifs(w),
              height: h - 115,
            )
          ],
        ),
      ),
    );
  }
}
