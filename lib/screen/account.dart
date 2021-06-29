import 'package:flutter/material.dart';
import 'home.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "INDOOR",
                  style: commonstyle(20.0, FontWeight.bold),
                ),
                Icon(
                  Icons.toggle_off_outlined,
                  size: 60,
                ),
                Text(
                  "OUTDOOR",
                  style: commonstyle(20.0, FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: Colors.amber.withOpacity(0.0),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.minimize),
                              Icon(
                                Icons.family_restroom,
                                size: 60,
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                          Text(
                            "Add Members",
                            style: commonstyle(20.0, FontWeight.bold),
                          ),
                          Text(
                            "ADDRESS",
                            style: commonstyle(24.0, FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "5",
                        style: commonstyle(28.0, FontWeight.w400),
                      ),
                      Icon(
                        Icons.family_restroom,
                        size: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "G-Block",
                            style: commonstyle(22.0, FontWeight.w400),
                          ),
                          Text(
                            "003",
                            style: commonstyle(20.0, FontWeight.bold),
                          ),
                          Text("GROUND FLOOR",
                              style: commonstyle(22.0, FontWeight.w400)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.power_settings_new,
                            size: 40,
                          ),
                          Text(
                            "LOGOUT",
                            style: commonstyle(22.0, FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
