class WeatherModel {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  int? clouds;
  String? iconId;
  List<String>? hourlyDt;
  List<double>? hourlyTemp;
  List<String>? hourlyIcon;
  List<double>? dailyTempMax;
  List<double>? dailyTempMin;
  List<String>? dailyIcon;
  List<String>? dailyDt;

  WeatherModel({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.clouds,
    this.iconId,
    this.hourlyDt,
    this.hourlyTemp,
    this.hourlyIcon,
    this.dailyTempMax,
    this.dailyTempMin,
    this.dailyIcon,
    this.dailyDt,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cityName = json["timezone"].toString();
    temp = (json["current"]["temp"] ?? 0).toDouble();
    wind = (json["current"]["wind_speed"] ?? 0).toDouble();
    humidity = json["current"]["humidity"] ?? 0;
    pressure = json["current"]["pressure"] ?? 0;
    clouds = json["current"]["clouds"] ?? 0;
    iconId = json["current"]["weather"][0]["icon"].toString();

    // Initialize lists and use a loop to fill them for 7 entries
    hourlyDt = List<String>.generate(7, (i) => json["hourly"][i]["dt"].toString());
    hourlyTemp = List<double>.generate(7, (i) => (json["hourly"][i]["temp"] ?? 0).toDouble());
    hourlyIcon = List<String>.generate(7, (i) => json["hourly"][i]["weather"][0]["icon"].toString());

    dailyTempMax = List<double>.generate(7, (i) => (json["daily"][i]["temp"]["max"] ?? 0).toDouble());
    dailyTempMin = List<double>.generate(7, (i) => (json["daily"][i]["temp"]["min"] ?? 0).toDouble());
    dailyIcon = List<String>.generate(7, (i) => json["daily"][i]["weather"][0]["icon"].toString());
    dailyDt = List<String>.generate(7, (i) => json["daily"][i]["dt"].toString());
  }
}
