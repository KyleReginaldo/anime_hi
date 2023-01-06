import 'package:anime_hi/domain/entity/anime_entity.dart';

class AnimeModel extends AnimeEntity {
  const AnimeModel({
    required super.currentPage,
    required super.hasNextPage,
    required super.results,
  });
  factory AnimeModel.fromMap(Map<String, dynamic> json) => AnimeModel(
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromMap(x))),
      );
}

class ResultModel extends ResultEntity {
  const ResultModel({
    required super.id,
    required super.title,
    required super.image,
    required super.url,
    required super.genres,
  });
  factory ResultModel.fromMap(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        url: json["url"],
        genres: List<String>.from(json["genres"].map((x) => x)),
      );
}
