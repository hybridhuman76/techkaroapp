import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techkaroapp/screen/home.dart';

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

List<String> names = [];

String addName, fammob;

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    memblist(w) {
      return ListView.builder(
          itemCount: names.length,
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
                          names[index],
                          style: commonstyle(l, FontWeight.normal),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              names.remove(names[index]);
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ));
            // return ListTile(
            //     leading: Icon(Icons.list),
            //     trailing: IconButton(icon: Icon(Icons.remove)),
            //     title: Text("List item $index"));
          });
    }

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green[600],
          child: Center(
            child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Add details of member"),
                          content: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  onChanged: (value) {
                                    addName = value;
                                  },
                                  decoration: InputDecoration(hintText: "Name"),
                                ),
                                TextField(
                                  onChanged: (value2) {
                                    fammob = value2;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number (optional)"),
                                ),
                              ],
                            ),
                          ),

                          // title: Text("Error"),
                          // content: Text(err.message),
                          // content:
                          //     Text("Invalid content, try again!"),
                          actions: [
                            TextButton(
                              child: Text("Add"),
                              onPressed: () async {
                                var num = names.length;
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(FirebaseAuth.instance.currentUser.uid)
                                    .update({
                                  'fam[$num]': "$addName, $fammob"
                                }).then((_) => Navigator.pop(context));
                                setState(() {
                                  names.add(addName);
                                });
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                },
                icon: Icon(Icons.add, color: Colors.white, size: 30)),
          )),
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
              child: memblist(w),
              height: h - 115,
            )
          ],
        ),
      ),
    );
  }
}
