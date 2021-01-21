import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Location Name for UI
  String time; //Time for the location
  String flag; //url to flag icon
  String url; // Location url for API endpoint
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getDateTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);

      //print('Date Time : $dateTime\nutc_offset : $utcOffset');
      DateTime now = DateTime.parse(dateTime);
      //print(now);
      now = now.add(Duration(hours: int.parse(offset)));

      //If hour is greater than 6 A.M. and less than 6 P.M. it is day time
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Exception : $e');
      time = 'Unable to get time';
    }
  }
}
