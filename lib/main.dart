import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ui_clock_and_alarm/shapes_painter.dart';
import 'package:ui_clock_and_alarm/widgets/alarm_item.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatefulWidget {

  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> with SingleTickerProviderStateMixin{

  String _timeString;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);

    _timeString = _formatDateTime(DateTime.now());
   Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

   @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
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
            backgroundColor: Color(0xff1B2C57),
            bottom: TabBar(
              controller: _tabController,
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
            color: Color(0xff1B2C57),
            child: TabBarView(
              controller: _tabController,
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
                      alarmItem(_timeString, true),
                      alarmItem(_timeString, true),
                      alarmItem(_timeString, false),
                      alarmItem(_timeString, false),
                    ],
                  ),
                ),
                Icon(Icons.hourglass_empty),
                Icon(Icons.timer),
              ],
            ),
          ),
          floatingActionButton: _bottomButtons(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController.index == 1
      ?FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: (){

        },
        backgroundColor: Color(0xff65D1BA),
        child: Icon(
          Icons.edit,
          size: 20.0,
        ),
      )
      :null;
  }
}