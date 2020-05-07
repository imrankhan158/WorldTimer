import 'dart:convert';

import 'package:http/http.dart';
import 'package:worldclock/source/world_time.dart';

class CountryList {
  static List<World_Time> locations = [
    World_Time(url: 'Asia/Kolkata', location: 'India', flag: 'indian.png'),
  ];

  Future<void> getLocations() async {
    Response response = await get('http://worldtimeapi.org/api/timezone');
    List<String> loca =
        (jsonDecode(response.body) as List<dynamic>).cast<String>();
    for (var lo in loca) {
      locations.add(
        World_Time(url: lo, location: lo, flag: 'world.jpg'),
      );
    }
  }
}
