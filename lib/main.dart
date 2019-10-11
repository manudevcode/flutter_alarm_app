import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ui_clock_and_alarm/shapes_painter.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatefulWidget {

  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {

  String _timeString;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff354569),
            bottom: TabBar(
              indicatorColor: Color(0xff65D1BA),
              indicatorWeight: 4.0,
              tabs: [
                Tab(icon: Icon(Icons.access_time), text: 'Clock',),
                Tab(icon: Icon(Icons.alarm), text: 'Alarm'),
                Tab(icon: Icon(Icons.hourglass_empty), text: 'Timer'),
                Tab(icon: Icon(Icons.timer), text: 'Stopwatch'),
              ],
            ),
          ),
          body: Container(
            color: Color(0xff354569),
            child: TabBarView(
              children: [
                Container(
                  child: Column(
                    children: <Widget>[  
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomPaint(
                          painter: ShapesPainter(),
                          child: Container(height: 500,),
                        ),
                      ),                   
                      Text(_timeString.toString(), style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro'
                      ),)
                    ],
                  ),
                ),
                Container(
                  child: ListView(
                    children: <Widget>[  
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(_timeString.toString(), style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SourceSansPro'
                                ),),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Text('Sun', style: TextStyle(
                                        
                                      ),),
                                    )
                                  ],
                                )
                              ],
                            ),
                            CupertinoSwitch(
                              value: true,
                              onChanged: (bool val) {
                                print(val);
                              },                    
                              activeColor: Color(0xff65D1BA),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Icon(Icons.hourglass_empty),
                Icon(Icons.timer),
              ],
            ),
          )
        ),
      ),
    );
  }
}