// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_hi/core/error/failure.dart';
import 'package:anime_hi/domain/entity/info_entity.dart';
import 'package:anime_hi/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class FetchAnimeInfo {
  final Repository repo;
  FetchAnimeInfo({
    required this.repo,
  });
  Future<Either<Failure, InfoEntity>> call({required String id}) async {
    return await repo.fetchAnimeInfo(id: id);
  }
}
