// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int currentPage;
  final bool hasNextPage;
  final List<ResultEntity> results;
  const AnimeEntity({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  });
  @override
  List<Object?> get props => [];
}

class ResultEntity extends Equatable {
  final String id;
  final String title;
  final String image;
  final String url;
  final List<String> genres;
  const ResultEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.url,
    required this.genres,
  });
  @override
  List<Object?> get props => [];
}
