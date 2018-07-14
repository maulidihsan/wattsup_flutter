import 'package:flutter/material.dart';
import 'package:watts_up/main.dart';

class PhoneVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: new Color(0xfff8faf8),
      ),
      body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: new Text(
                    "Phone verification", style: TextStyle(
                      color: Colors.black, fontSize: 30.0
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: new Text("Enter your phone number, then login or register your account", style: TextStyle(fontSize: 10.0, color: Colors.grey))),
                Container(
                  width: 350.0,
                  height: 50.0,
                  child: ListTile(
                    leading: new Text("+62", style: TextStyle(color: Colors.black),),
                    title: new TextField(
                      decoration: new InputDecoration(
                        hintText: "Enter mobile phone"
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 250.0,
                      child: ListTile(
                        leading: new Text("PIN", style: TextStyle(color: Colors.black)),
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: "Enter PIN"
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: RaisedButton(
                        child: new Text("SMS PIN", style: TextStyle(color: Colors.black)),
                        color: Colors.grey,
                      ),
                    )
                  ]
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  alignment: Alignment.center,
                  child: MaterialButton(
                    minWidth: 325.0,
                    height: 40.0,
                    onPressed: () {},
                    child: new Text("Start", style: TextStyle(color: Colors.black)),
                    color: Colors.grey,
                  ),
                ),             
                Center(
                  child: new Text(
                    "By clicking start, you agree to the Term of Service", style: TextStyle(fontSize: 13.0, color: Colors.grey), 
                  )
                )
              ],
            ), 
      );
  }
}