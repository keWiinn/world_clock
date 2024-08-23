import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time = ''; // the time in that location, initialized to an empty string
  String flag; // URL to an asset flag icon
  String url; // location URL for API endpoint
  bool isDaytime = false; // true or false if daytime or not, initialized to false

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      // Make the request
      final response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      // Check if the request was successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Log the entire response for debugging
        print('API Response: $data');

        // Get properties from JSON
        String datetime = data['datetime'];
        String offset = data['utc_offset'];

        // Parse the offset to get hours
        int offsetHours = int.parse(offset.substring(1, 3)); // Handle ±HH format

        // Create DateTime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: offsetHours));

        // Set the time and isDaytime properties
        isDaytime = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      } else {
        print('Failed to load time');
        time = 'Could not get time';
      }
    } catch (e) {
      print('Error: $e');
      time = 'Could not get time';
    }
  }

}
