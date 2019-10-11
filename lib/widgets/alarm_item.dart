import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget alarmItem(hour, enabled){
  return Padding(
    padding: EdgeInsets.all(17.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(hour, style: TextStyle(
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
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Mon', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Tue', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),),
                    )
                  ],
                ),                                
              ],
            ),
            CupertinoSwitch(
              value: enabled,
              onChanged: (bool val) {
                print(val);
              },                    
              activeColor: Color(0xff65D1BA),
            ),
          ],
        ),
        SizedBox(height: 10.0,),
        SizedBox(
          height: 1.0,
          width: double.maxFinite,
          child: Container(
            color: Colors.white30,
          ),
        )
      ],
    ),
  );
}