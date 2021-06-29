import 'package:flutter/material.dart';
import 'package:techkaroapp/screen/account.dart';
import 'package:techkaroapp/screen/login_signup.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSignupScreen()));
                      },
                      icon: Icon(
                        Icons.menu_sharp,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Account()));
                    },
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
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
                      Text("FAMILY MEMBERS - 3",
                          style: commonstyle(26.0, FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Row(
                children: [
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
                              "BILL OVERDUE",
                              style: commonstyle(22.0, FontWeight.w400),
                            ),
                            Text(
                              "2089",
                              style: commonstyle(20.0, FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text("JUNE 2021",
                                    style: commonstyle(18.0, FontWeight.w800)),
                                MaterialButton(
                                  color: Colors.amber,
                                  child: Text("PAY"),
                                  onPressed: () {},
                                )
                              ],
                            )
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
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "COMPLAINT",
                              style: commonstyle(22.0, FontWeight.w400),
                            ),
                            Text(
                              "TICKET-G23",
                              style: commonstyle(20.0, FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text("Door",
                                    style: commonstyle(18.0, FontWeight.w800)),
                                MaterialButton(
                                  color: Colors.amber,
                                  child: Text("mark as resolved"),
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
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
                    cont(Icons.chat, "Message"),
                    cont(Icons.supervised_user_circle_sharp, "Services"),
                    cont(Icons.bookmark_rounded, "Billing"),
                    cont(Icons.visibility_off_sharp, "Visitors"),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 50,
                // width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: Text(
                  "HELPDESK & SUPPORT",
                  style: commonstyle(20.0, FontWeight.bold),
                )),
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
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 40,
              ),
              Text(
                text,
                style: commonstyle(20.0, FontWeight.bold),
              )
            ],
          )));
}

commonstyle(fontsize, weight) {
  return TextStyle(fontSize: fontsize, fontWeight: weight);
}
