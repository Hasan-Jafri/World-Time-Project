import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = "None"; // Location name for th UI.
  String time = "None"; // Time in that location.
  String flag = "None"; // Url to an asset flag icon.
  String url = "None"; // Location URL for the API end point.
  bool isDaytime = false; //Checks for day or night.

  WorldTime({location, flag, url}) {
    this.location = location;
    this.flag = flag;
    this.url = url;
  }

  Future<void> getTime() async {
    try {
      //Make the request.
      Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // print(response.body);

      Map data = jsonDecode(response.body);
      //Get Properties from data.
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      print(offset);
      int offsetHours = int.parse(offset.substring(1, 3));
      int offsetMinutes = int.parse(offset.substring(4, 6));
      DateTime now = DateTime.parse(datetime);
      print(now);
      if (offset[0] == '-') {
        now = now.subtract(Duration(hours: offsetHours,minutes: offsetMinutes));
      } else {
        now = now.add(Duration(hours: offsetHours,minutes: offsetMinutes));
      }

      //Set the time property.
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Caught Error: $e");
      time = 'Could not get Data';
    }
  }
}
