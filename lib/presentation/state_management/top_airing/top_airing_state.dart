// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'top_airing_bloc.dart';

abstract class TopAiringState extends Equatable {
  const TopAiringState();

  @override
  List<Object> get props => [];
}

class TopAiringInitial extends TopAiringState {}

class TopAiringLoaded extends TopAiringState {
  final AnimeEntity anime;
  const TopAiringLoaded({
    required this.anime,
  });
}

class TopAiringLoading extends TopAiringState {}

class TopAiringError extends TopAiringState {
  final String message;
  const TopAiringError({
    required this.message,
  });
}
