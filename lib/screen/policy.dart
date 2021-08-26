import 'package:flutter/material.dart';

class Policy extends StatefulWidget {
  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Center(child: Text("Hello")),
            Container(
              width: w - 40,
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vel laoreet risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eleifend eu sapien et pretium. Proin scelerisque nec leo sed cursus. Aliquam libero ligula, pretium in sem sed, faucibus pretium mi. Sed porta elementum congue. Ut pulvinar, nisl sed facilisis pretium, libero tortor vehicula magna, ut tincidunt massa mauris quis metus. Duis aliquam non libero id aliquam. Donec congue nisl velit, ut lacinia ligula iaculis at. Curabitur elit eros, volutpat vitae semper sit amet, rutrum ut ex. Suspendisse rhoncus, eros at ultrices mattis, mauris lacus sollicitudin orci, eget pharetra felis risus et dui. Phasellus semper ac mauris non pretium."),
            ),
          ],
        ),
      ),
    ));
  }
}
