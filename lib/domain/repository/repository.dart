import 'package:anime_hi/core/error/failure.dart';
import 'package:anime_hi/domain/entity/anime_entity.dart';
import 'package:anime_hi/domain/entity/info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, AnimeEntity>> fetchTopAiringAnime();
  Future<Either<Failure, InfoEntity>> fetchAnimeInfo({required String id});
}
