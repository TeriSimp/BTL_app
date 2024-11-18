import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather_model.dart';

const String apikey = '708cca98e651dd136b52e5d7eee3b166';

class WeatherApiClient {
  Future<WeatherModel?> getWeatherModel(String? lat, String? lon) async {
    try {
      var endpoint = Uri.parse(
          "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apikey&units=metric");

      // Gửi yêu cầu GET
      var response = await http.get(endpoint);

      // Kiểm tra mã trạng thái HTTP
      if (response.statusCode == 200) {
        // Phân tích cú pháp JSON khi yêu cầu thành công
        var body = jsonDecode(response.body);

        // Chuyển đổi JSON thành đối tượng WeatherModel
        WeatherModel weather = WeatherModel.fromJson(body);

        print(weather.cityName);
        print(weather.hourlyTemp);
        print(weather.hourlyIcon);
        print(weather.dailyTempMax);
        print(weather.dailyDt);
        print(weather.hourlyDt);

        return weather;
      } else {
        print("Lỗi không load được thông tin: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Xảy ra lỗi: $e");
      return null;
    }
  }
}
