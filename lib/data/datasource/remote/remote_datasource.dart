import 'package:anime_hi/data/model/anime_model.dart';
import 'package:anime_hi/data/model/info_model.dart';

abstract class RemoteDatasource {
  Future<AnimeModel> fetchTopAiringAnime();
  Future<InfoModel> fetchAnimeInfo({required String id});
}
