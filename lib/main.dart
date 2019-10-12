import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_clock_and_alarm/add_alarm.dart';

import 'home.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatefulWidget {

  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/add-alarm': (context) => AddAlarm(),
      },
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: Color(0xff1B2C57),
        accentColor: Color(0xff65D1BA)
      ),
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}