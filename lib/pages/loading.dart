import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setup_world_time() async {
    WorldTime wt =
        WorldTime(location: 'Karachi', flag: 'Pak.png', url: 'Asia/Karachi');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDaytime': wt.isDaytime,
    });
  }

  @override
  void initState() {
    setup_world_time();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 46, 82),
        body: Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 50,
          ),
        ));
  }
}
