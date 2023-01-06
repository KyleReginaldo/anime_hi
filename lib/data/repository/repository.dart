// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_hi/core/error/exception.dart';
import 'package:anime_hi/data/datasource/remote/remote_datasource.dart';
import 'package:anime_hi/domain/entity/anime_entity.dart';
import 'package:anime_hi/domain/entity/info_entity.dart';
import 'package:anime_hi/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

class RepositoryImpl implements Repository {
  final RemoteDatasource remote;
  RepositoryImpl({
    required this.remote,
  });
  @override
  Future<Either<Failure, AnimeEntity>> fetchTopAiringAnime() async {
    try {
      return Right(await remote.fetchTopAiringAnime());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, InfoEntity>> fetchAnimeInfo(
      {required String id}) async {
    try {
      final result = await remote.fetchAnimeInfo(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
