import 'package:gallery/Home/HomeRepository.dart';
import 'package:gallery/Responses/UnsplashReponse.dart';

class HomeBloc {
  final repo = HomeRepository();

  Future<UnsplashResponse> getImages(query) async {
    UnsplashResponse data = await repo.getImages(query);
    return data;
  }
}
