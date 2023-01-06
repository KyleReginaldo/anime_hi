import 'package:anime_hi/domain/entity/info_entity.dart';

class InfoModel extends InfoEntity {
  InfoModel({
    required super.id,
    required super.title,
    required super.url,
    required super.genres,
    required super.totalEpisodes,
    required super.image,
    required super.releaseDate,
    required super.description,
    required super.subOrDub,
    required super.type,
    required super.status,
    required super.otherName,
    required super.episodes,
  });
  factory InfoModel.fromMap(Map<String, dynamic> json) => InfoModel(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        totalEpisodes: json["totalEpisodes"],
        image: json["image"],
        releaseDate: json["releaseDate"],
        description: json["description"],
        subOrDub: json["subOrDub"],
        type: json["type"],
        status: json["status"],
        otherName: json["otherName"],
        episodes: List<EpisodeModel>.from(
            json["episodes"].map((x) => EpisodeModel.fromMap(x))),
      );
}

class EpisodeModel extends EpisodeEntity {
  EpisodeModel({
    required super.id,
    required super.number,
    required super.url,
  });
  factory EpisodeModel.fromMap(Map<String, dynamic> json) => EpisodeModel(
        id: json["id"],
        number: json["number"],
        url: json["url"],
      );
}
