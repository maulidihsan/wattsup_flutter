import 'dart:async';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'package:watts_up/phone_verification.dart';
import 'package:watts_up/package_options.dart';
import 'package:watts_up/top_up.dart';
import 'package:watts_up/payment.dart';

var api_key = "AIzaSyDSCUS4DzidK4q5gMidoXNqYmWWE-c0Cr8";

// Fungsi run app
void main() {
  MapView.setApiKey(api_key);
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: Colors.black,
      primaryIconTheme: IconThemeData(color: Colors.black),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => new MapPage(),
      '/phoneverif': (context) => new PhoneVerification(),
      '/unlock': (context) => new PackageOptions(),
      '/topup': (context) => new TopUp(),
      '/payment': (context) => new Payment()
    },
  ));
} 

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider = new StaticMapProvider(api_key);
  Uri staticMapUri;

  List<Marker> _markers = <Marker>[
    new Marker("1", "Work", -6.1922009,106.8408011, color: Colors.blue),
    new Marker("2", "Nossa Familia Coffee", -6.1922009,106.8408011),
  ];

  // Fungsi untuk nampilin map activity
  showMap() {
    mapView.show(
      new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: new CameraPosition(new Location(-6.1922009,106.8408011), 17.0),
        showUserLocation: true,
        title: "Recent Location",
        
      )
    );
    _handleDismiss() async {
    double zoomLevel = await mapView.zoomLevel;
    Location centerLocation = await mapView.centerLocation;
    List<Marker> visibleAnnotations = await mapView.visibleAnnotations;
    print("Zoom Level: $zoomLevel");
    print("Center: $centerLocation");
    print("Visible Annotation Count: ${visibleAnnotations.length}");
    var uri = await staticMapProvider.getImageUriFromMap(mapView,
        width: 900, height: 400);
    setState(() => staticMapUri = uri);
    mapView.dismiss();
    compositeSubscription.cancel();
  }

    var sub = mapView.onMapReady.listen((_) {
      mapView.setMarkers(_markers);
      mapView.addMarker(new Marker("3", "10 Barrel",-6.1922009,106.8408011,
          color: Colors.purple));
      mapView.zoomToFit(padding: 100);
    });
    compositeSubscription.add(sub);

    sub = mapView.onLocationUpdated
        .listen((location) => print("Location updated $location"));
    compositeSubscription.add(sub);

    sub = mapView.onTouchAnnotation
        .listen((annotation) => print("annotation tapped"));
    compositeSubscription.add(sub);

    sub = mapView.onMapTapped
        .listen((location) => print("Touched location $location"));
    compositeSubscription.add(sub);

    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub);

    sub = mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _handleDismiss();
      }
    });
    compositeSubscription.add(sub);

    sub = mapView.onInfoWindowTapped.listen((marker) {
      print("Info Window Tapped for ${marker.title}");
    });
    compositeSubscription.add(sub);
    
  }

  // Ngambil Thumbnail Map
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      cameraPosition = new CameraPosition(new Location(-6.1922009,106.8408011), 17.0);
      staticMapUri = staticMapProvider.getStaticUri(
        new Location(-6.1922009,106.8408011),
        18,
        height: 2560,
        width: 2560,
        mapType: StaticMapViewType.roadmap);
    }

  // Konstruksi UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar Header
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        centerTitle: false,
        elevation: 1.0,
        leading: new IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/phoneverif');
            },
        ),
        title: SizedBox(
          height: 35.0,
          child: Image.asset("assets/images/insta_logo.png")
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.chat),
          )
        ],
      ),

      // Body
      body: Stack(
        children: <Widget>[
          new Center(
            child: new Text("Map show here", textAlign: TextAlign.center)
          ),
          new InkWell(
            child: new Image.network(staticMapUri.toString(), fit: BoxFit.cover, height: double.infinity,),
            onTap: () {
              showMap();
            },
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: new GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/unlock');
                },
                child: Container(
                  decoration: new BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.black),
                    borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
                    color: Colors.black
                  ),
                  padding: const EdgeInsets.fromLTRB(120.0, 10.0, 120.0, 10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Icon(Icons.scanner, color: Colors.white),
                      new SizedBox(width: 5.0),
                      new Text("Unlock", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}



class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}

