import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/api/world_time.dart';

class ChooseLocations extends StatefulWidget {
  @override
  _ChooseLocationsState createState() => _ChooseLocationsState();
}

class _ChooseLocationsState extends State<ChooseLocations> {
  int counter = 0;

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getDateTime();
    //Navigate to home screen
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isdayTime': worldTime.isDayTime,
    });
  }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void initState() {
    //getData(); //Function call will not bloack the rest of function as it has been declared as async
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Choose a location'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1.0,
                horizontal: 4.0,
              ),
              child: Card(
                child: ListTile(
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/${locations[index].flag}'),
                  ),
                  onTap: () {
                    updateTime(index);
                    print('Location CLicked : ${locations[index].location}');
                  },
                ),
              ),
            );
          },
        ));
  }
}
