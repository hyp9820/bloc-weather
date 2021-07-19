import 'package:gallery/Home/HomeDio.dart';
import 'package:gallery/Responses/UnsplashReponse.dart';

class HomeRepository {
  final homeDio = HomeDio();

  Future<UnsplashResponse> getImages(query) => homeDio.getImages(query);
}
