import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:techkaroapp/screen/home.dart';
import 'package:techkaroapp/config/fontS.dart';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

List<String> complaints = [];
String newComplaint;

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    complaintlist(w) {
      return ListView.builder(
          itemCount: complaints.length,
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
                          complaints[index],
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

    if (complaints.length == 0) {
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
                            title: Text("Add Complaint"),
                            content: Container(
                              height: 150,
                              child: Column(
                                children: <Widget>[
                                  TextField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(100)
                                    ],
                                    onChanged: (value) {
                                      newComplaint = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Type your complaint"),
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
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(
                                          FirebaseAuth.instance.currentUser.uid)
                                      .update({
                                    'complaints':
                                        FieldValue.arrayUnion(["$newComplaint"])
                                  }).then((_) => Navigator.pop(context));
                                  // setState(() {
                                  //   names.add(addName);
                                  // });
                                  // Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add, color: Colors.white, size: 30)),
            )),
        body: Container(
          child: Center(child: Text("You dont have any pending complaints!")),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          child: complaintlist(w),
        ),
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
                                      newComplaint = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Type your complaint"),
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
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(
                                          FirebaseAuth.instance.currentUser.uid)
                                      .update({
                                    'complaints':
                                        FieldValue.arrayUnion(["$newComplaint"])
                                  }).then((_) => Navigator.pop(context));
                                  // setState(() {
                                  //   names.add(addName);
                                  // });
                                  // Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add, color: Colors.white, size: 30)),
            )),
      );
    }
  }
}
