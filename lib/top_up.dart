import 'package:flutter/material.dart';

class TopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8faf8),
      appBar: new AppBar(
        backgroundColor: new Color(0xfff8faf8),
        title: new Text("Top-Up Account", style: TextStyle(color: Colors.black)),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15.0),
                child: new Text(
                  "Please select top-up ammount", style: TextStyle(
                  color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                          padding: const EdgeInsets.all(15.0),
                          minWidth: 170.0,
                          height: 70.0,
                          onPressed: () {},
                          child: new Text("Next", style: TextStyle(color: Colors.white)),
                          color: Colors.redAccent,
                      ),
                      MaterialButton(
                          padding: const EdgeInsets.all(15.0),
                          minWidth: 170.0,
                          height: 70.0,
                          onPressed: () {},
                          child: new Text("Next", style: TextStyle(color: Colors.white)),
                          color: Colors.grey,
                      ),
                    ],
                  ),
                  Container(
                    width: 400.0,
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                          padding: const EdgeInsets.all(15.0),
                          minWidth: 170.0,
                          height: 70.0,
                          onPressed: () {},
                          child: new Text("Next", style: TextStyle(color: Colors.white)),
                          color: Colors.grey,
                      ),
                      MaterialButton(
                          padding: const EdgeInsets.all(15.0),
                          minWidth: 170.0,
                          height: 70.0,
                          onPressed: () {},
                          child: new Text("Next", style: TextStyle(color: Colors.white)),
                          color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Icon(Icons.credit_card),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Text("Debit/Credit Card", style: TextStyle(color: Colors.black))
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 14.0,
                      child: new Icon(Icons.check, size: 16.0, color: Colors.white),
                    )
                  ],
                ),
              ),
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
                    Navigator.pushNamed(context, '/payment');
                  },
                  child: new Text("Top-up", style: TextStyle(color: Colors.white)),
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}