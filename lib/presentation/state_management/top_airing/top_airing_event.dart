part of 'top_airing_bloc.dart';

abstract class TopAiringEvent extends Equatable {
  const TopAiringEvent();

  @override
  List<Object> get props => [];
}

class FetchTopAiringAnimeEvent extends TopAiringEvent {}
