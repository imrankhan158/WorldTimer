import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class World_Time {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  World_Time({this.flag, this.location, this.url});

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offsetHour = data['utc_offset'].substring(1, 3);
    String offsetMinute = data['utc_offset'].substring(4, 6);

    if (offsetHour[0] == '-') {
      offsetMinute = '-' + offsetMinute;
    }

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsetHour)));
    now = now.add(Duration(minutes: int.parse(offsetMinute)));

    time = DateFormat.jm().format(now);

    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
  }
}
