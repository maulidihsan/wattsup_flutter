import 'package:flutter/material.dart';


class PackageOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf6f6f6f6),
      appBar: new AppBar(
        backgroundColor: new Color(0xfff8faf8),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          // 1st row
          Container(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Select Package Options",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),

          // 2nd row
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color(0xf5f5f5f5)),
                borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
                color: Color(0xf6f6f6f6)
              ),
              padding: const EdgeInsets.all(15.0),
              width: 340.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "30 Days WattsUp Pass",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 14.0,
                        child: new Icon(Icons.check, size: 16.0, color: Colors.white),
                      )
                    ],
                  ),
                  Text(
                    "IDR XXX.XXX",
                    style: TextStyle(color: Colors.black54, fontSize: 28.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 170.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Deposit-free 30 days\n", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                              new Text("Enjoy unlimited FREE charge under 2 hours per trip\n", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                              new Text("Valid anywhere in Indonesia\n", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                              new Text("Auto-renews for credit card users (cancelable)\n", style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                            ],
                          ),
                        ),
                        new SizedBox(
                          height: 20.0,
                          child: Image.asset("assets/images/insta_logo.png"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
          // 3rd row
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color(0xf5f5f5f5)),
                borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
                color: Color(0xf6f6f6f6)
              ),
              padding: const EdgeInsets.all(15.0),
              width: 340.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Pay as you go",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 14.0,
                        child: new Icon(Icons.check, size: 16.0, color: Colors.white),
                      )
                    ],
                  ),
                  new Text("Pay the single rent price", style: TextStyle(color: Colors.grey))
                ]
              ),
            )
          ),

          // 4th row
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Color(0xf5f5f5f5)),
                borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
                color: Color(0xf6f6f6f6)
              ),
              padding: const EdgeInsets.all(15.0),
              width: 340.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Redeem",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 14.0,
                        child: new Icon(Icons.check, size: 16.0, color: Colors.white),
                      )
                    ],
                  ),
                  new Text("Redeem your coupon.", style: TextStyle(color: Colors.grey))
                ]
              ),
            )
          ),

          // Button
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
                    Navigator.pushNamed(context, '/topup');
                  },
                  child: new Text("Top-up", style: TextStyle(color: Colors.white)),
                  color: Colors.grey,
                ),
              ),
            ),
          )
          
        ],
      ),
    );
  }
}