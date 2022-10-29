import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getLocationMethodReferenceFunctionAndApiData();
  }

  void getLocationMethodReferenceFunctionAndApiData() async {
    WeatherModel weatherModelObj = WeatherModel();
    var weatherData = await weatherModelObj.getLocationWether();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
