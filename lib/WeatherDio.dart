import 'package:dio/dio.dart';
import 'package:weather/WeatherModel.dart';

class WeatherDio {
  static const appid = "c9835713500e06ddb5cb8241ee4c048f";

  Future<WeatherModel> getWeather(String city) async {
    BaseOptions options = BaseOptions(
      connectTimeout: 900000,
      responseType: ResponseType.json,
    );
    Dio dio = new Dio(options);
    dio.interceptors.add(
      LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true),
    );

    final response = await dio.get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appid");

    if (response.statusCode != 200) {
      throw Exception();
    }

    WeatherModel result = WeatherModel.fromJson(response.data['main']);
    return result;
  }
}
