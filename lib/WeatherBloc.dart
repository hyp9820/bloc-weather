import 'package:weather/WeatherModel.dart';
import 'package:weather/WeatherRepository.dart';

class WeatherBloc {
  final repo = WeatherRepository();

  Future<WeatherModel> getWeather(String city) async {
    WeatherModel data = await repo.getWeather(city);
    return data;
  }
}
