import 'package:dio/dio.dart';
import 'package:gallery/Responses/UnsplashReponse.dart';

class HomeDio {
  static const client_id = "YOUR_API_KEY";

  Future<UnsplashResponse> getImages(query) async {
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
        "https://api.unsplash.com/search/photos?query=$query&page=1&per_page=20&orientation=squarish&client_id=$client_id");

    if (response.statusCode != 200) {
      throw Exception("<==API RESPONSE NOT SUCCESSFUL!==>");
    }

    UnsplashResponse result = UnsplashResponse.fromJson(response.data);
    return result;
  }
}
