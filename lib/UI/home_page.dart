import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _getLocation() async {
    var currentLocation = <String, double>{};
    var location = new Location();

    try {
      currentLocation = await location.getLocation;
      
      print(currentLocation["latitude"]);
      print(currentLocation["longitude"]);
      print(currentLocation["accuracy"]);
      print(currentLocation["altitude"]);
      print(currentLocation["speed"]);
      print(currentLocation["speed_accuracy"]); // Will always be 0 on iOS

    } on PlatformException {
      currentLocation = null;
      print("Could not get location");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Location Exampe"), centerTitle: true,),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text("Get Location"),
              onPressed: _getLocation,
            )
          ],
        ),
      ),
    );
  }
}