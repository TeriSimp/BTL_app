import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/text_style.dart';

String getDay(final day) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
  final formattedDay = DateFormat('EEE', 'vi').format(time);
  return formattedDay;
}

Widget DailyForecast(String dt, String iconId, String tempMax, String tempMin) {
  return SizedBox(
    height: 65,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 1,
          width: 250,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(getDay(int.parse(dt)), style: daytimeStyle),
              Image.asset(
                "assets/weather/$iconId.png",
                height: 40,
                width: 40,
              ),
              Text("$tempMax/$tempMin \u2103", style: tempStyle),
            ],
          ),
        ),
      ],
    ),
  );
}
