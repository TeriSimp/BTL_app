import 'package:flutter/material.dart';
import 'package:weather_app/text_style.dart';

Widget currentWeatherDetails(String wind, String clouds, String humidity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset("assets/icons/windspeed.png"),
          ),
          const SizedBox(height: 8),
          Text("$wind km/h", style: tempStyle),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset("assets/icons/clouds.png"),
          ),
          const SizedBox(height: 8),
          Text("$clouds%", style: tempStyle),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset("assets/icons/humidity.png"),
          ),
          const SizedBox(height: 8),
          Text("$humidity%", style: tempStyle), // Áp dụng tempStyle cho hiển thị độ ẩm
        ],
      ),
    ],
  );
}
