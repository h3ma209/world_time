import "package:flutter/material.dart";
import "package:world_time/services/world_time.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        flag: "germany.png", location: "Berlin", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body:
          // ignore: prefer_const_constructors
          Center(child: SpinKitCubeGrid(color: Colors.white, size: 90.0)),
    );
  }
}
