// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_hi/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entity/anime_entity.dart';

class FetchTopAiringAnime {
  final Repository repo;
  FetchTopAiringAnime({
    required this.repo,
  });
  Future<Either<Failure, AnimeEntity>> call() async {
    return await repo.fetchTopAiringAnime();
  }
}
