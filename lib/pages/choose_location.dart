import 'package:flutter/material.dart';
import 'package:project2/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'New Delhi', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'France.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'uae.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'south_africa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'São Paulo', flag: 'brazil.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'mexico.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
