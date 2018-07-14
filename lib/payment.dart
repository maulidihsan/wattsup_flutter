import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xfff8faf8),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                "Add Payment Method",
                style: TextStyle(color: Colors.black, fontSize: 28.0),
              ),
            ),
            Container(
              width: 350.0,
              height: 50.0,
              child: ListTile(
                leading: new Text("Card No.", style: TextStyle(color: Colors.black),),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Enter your card number"
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Container(
              width: 350.0,
              height: 50.0,
              child: ListTile(
                leading: new Text("Exp. Date", style: TextStyle(color: Colors.black),),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "MM/YY"
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            Container(
              width: 350.0,
              height: 50.0,
              child: ListTile(
                leading: new Text("CVV Code", style: TextStyle(color: Colors.black),),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "123"
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            )
          ],
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                alignment: Alignment.center,
                child: MaterialButton(
                  minWidth: 325.0,
                  height: 40.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: new Text("Save", style: TextStyle(color: Colors.white)),
                  color: Colors.redAccent,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}