import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/text_style.dart';

String datetime = DateFormat("d MMMM, y", "vi_VN").format(DateTime.now());

Widget cityHeader(String location, String temp, String iconId) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(location, style: daytimeStyle),
          Text(datetime, style: tempStyle),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/weather/$iconId.png",
            height: 60,
            width: 60,
          ),
          Text(
            "$temp \u2103",
            style: tempNowStyle,
          ),
        ],
      ),
    ],
  );
}
