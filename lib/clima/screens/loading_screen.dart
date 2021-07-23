import 'package:flutter/material.dart';
import 'package:flutter_todo_app/clima/services/location.dart';
import 'package:flutter_todo_app/clima/services/networking.dart';

const appKey = 'be2a32e308a082c32616eb2dc3546360';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentlocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appKey");

    dynamic decodeData = await networkHelper.getData();
    // print(decodeData['main']['temp']);
    // print(decodeData['weather'][0]['id']);
    // print(decodeData['name']);
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '12';
    double? myMarginAsDouble;

    try {
      myMarginAsDouble = double.parse(myMargin);
    } catch (e) {
      print(e);
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
        color: Colors.red,
      ),
    );
  }
}
