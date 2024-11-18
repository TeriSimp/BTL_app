import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/global_controller.dart';
import 'package:weather_app/text_style.dart';
import 'package:weather_app/weather_model.dart';
import 'package:weather_app/weather_api_client.dart';
import 'package:weather_app/widgets/hourly_widget.dart';
import 'package:weather_app/widgets/city_header.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/daily_forecast_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  WeatherApiClient client = WeatherApiClient();
  WeatherModel? data;

  Future<void> getData() async {
    data = await client.getWeatherModel(
      globalController.latitude.value.toString(),
      globalController.longitude.value.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                const SizedBox(height: 30),
                Container(
                  child: cityHeader(
                    "${data?.cityName}",
                    "${data?.temp}",
                    "${data?.iconId}",
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: currentWeatherDetails(
                      "${data?.wind}",
                      "${data?.clouds}",
                      "${data?.humidity}"
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
                  child: Text(
                    "Hôm nay",
                    style: daytimeStyle,
                  ),
                ),
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width - 125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, index) {
                      return hourlyWidget(
                        "${data?.hourlyTemp?[index]}",
                        "${data?.hourlyIcon?[index]}",
                        "${data?.hourlyDt?[index]}",
                        index,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.all(12),
                  height: 350,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Dự báo trong 7 ngày tới:",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 250,
                        width: 400,
                        child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (BuildContext context, index) {
                            return DailyForecast(
                              "${data?.dailyDt![index]}",
                              "${data?.dailyIcon?[index]}",
                              "${data?.dailyTempMax?[index]}",
                              "${data?.dailyTempMin?[index]}",
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
