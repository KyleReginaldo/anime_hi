// ignore_for_file: public_member_api_docs, sort_constructors_first
class InfoEntity {
  final String id;
  final String title;
  final String url;
  final List<String> genres;
  final int totalEpisodes;
  final String image;
  final String releaseDate;
  final String description;
  final String subOrDub;
  final String type;
  final String status;
  final String otherName;
  final List<EpisodeEntity> episodes;
  InfoEntity({
    required this.id,
    required this.title,
    required this.url,
    required this.genres,
    required this.totalEpisodes,
    required this.image,
    required this.releaseDate,
    required this.description,
    required this.subOrDub,
    required this.type,
    required this.status,
    required this.otherName,
    required this.episodes,
  });
}

class EpisodeEntity {
  final String id;
  final int number;
  final String url;
  EpisodeEntity({
    required this.id,
    required this.number,
    required this.url,
  });
}
