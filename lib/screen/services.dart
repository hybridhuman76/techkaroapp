import 'package:flutter/material.dart';
import 'package:techkaroapp/config/fontS.dart';
import 'package:techkaroapp/screen/account.dart';
import 'package:techkaroapp/screen/home.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                servicescont(w, Icons.local_grocery_store_outlined, "Grocery"),
                servicescont(w, Icons.ac_unit, "AC Service"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                servicescont(w, Icons.format_paint, "Painter"),
                servicescont(w, Icons.water_sharp, "RO Service"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                servicescont(w, Icons.bloodtype_outlined, "Water Supply"),
                servicescont(w, Icons.pest_control, "Pest Control"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                servicescont(w, Icons.plumbing, "Plumber"),
                servicescont(w, Icons.wifi_rounded, "Electrician"),
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
