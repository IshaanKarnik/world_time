import 'package:flutter/material.dart';
import 'package:world_time/api/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(
      location: 'Kolkata',
      flag: 'India.png',
      url: '/Asia/Kolkata',
    );
    await worldTime.getDateTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isdayTime' : worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
      child: SpinKitRing(
        color: Colors.white,
        size: 80.0,
      ),
    ));
  }
}
