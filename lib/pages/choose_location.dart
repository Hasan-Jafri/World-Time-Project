import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'Eng.png', url: 'Europe/London'),
    WorldTime(location: 'Kolkata', flag: 'Ind.png', url: 'Asia/Kolkata'),
    WorldTime(location: 'Tehran', flag: 'Iran.png', url: 'Asia/Tehran'),
    WorldTime(location: 'New York', flag: 'America.png', url: 'America/New_York'),
    WorldTime(location: 'Seoul', flag: 'S.Korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Karachi', flag: 'Pak.png', url: 'Asia/Karachi'),
    WorldTime(location: 'Cairo', flag: 'Egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Kabul', flag: 'Afg.png', url: 'Asia/Kabul'),
    WorldTime(location: 'Paris', flag: 'France.png', url: 'Europe/Paris'),
    WorldTime(location: 'Shanghai', flag: 'China.png', url: 'Asia/Shanghai'),
    WorldTime(location: 'Brussels', flag: 'Bel.png', url: 'Europe/Brussels'),
    WorldTime(location: 'Rome', flag: 'Italy.png', url: 'Europe/Rome'),
    
  ];

  void updatetime(index) async {
    WorldTime wt = locations[index];
    await wt.getTime();
    // Navigate to Home Screen
    Navigator.pop(context, {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDaytime': wt.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 32, 58),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 46, 82),
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            child: Card(
              color: Colors.transparent,
              child: ListTile(
                onTap: () {
                  updatetime(index);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
