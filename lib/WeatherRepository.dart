import 'package:weather/WeatherDio.dart';
import 'package:weather/WeatherModel.dart';

class WeatherRepository {
  final weatherDio = WeatherDio();

  Future<WeatherModel> getWeather(String city) => weatherDio.getWeather(city);
}
