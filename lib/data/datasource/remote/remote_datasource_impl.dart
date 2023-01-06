import 'dart:convert';

import 'package:anime_hi/core/error/exception.dart';
import 'package:anime_hi/data/datasource/remote/remote_datasource.dart';
import 'package:anime_hi/data/model/anime_model.dart';
import 'package:anime_hi/data/model/info_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/strings.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  @override
  Future<AnimeModel> fetchTopAiringAnime() async {
    print('called1');
    final response = await http.get(
      Uri.parse('$BASE_URL/anime/gogoanime/top-airing'),
      // headers: {'Content-type': 'application/json'},
    );
    print('top-airing1: ${response.statusCode}');
    if (response.statusCode == 200) {
      final animeData = jsonDecode(response.body);
      print('anime-data1: ${animeData.runtimeType}');
      return AnimeModel.fromMap(animeData);
    } else {
      final errorData = jsonDecode(response.body);
      throw ServerException(message: errorData['message']);
    }
  }

  @override
  Future<InfoModel> fetchAnimeInfo({required String id}) async {
    final response = await http.get(
      Uri.parse('$BASE_URL/anime/gogoanime/info/$id'),
      // headers: {'Content-type': 'application/json'},
    );
    print('info2: ${response.statusCode}');
    if (response.statusCode == 200) {
      final animeData = jsonDecode(response.body);
      print('anime-data2: ${animeData.runtimeType}');
      return InfoModel.fromMap(animeData);
    } else {
      final errorData = jsonDecode(response.body);
      throw ServerException(message: errorData['message']);
    }
  }
}
