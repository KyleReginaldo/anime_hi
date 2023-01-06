// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_hi/domain/entity/anime_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_hi/domain/usecase/fetch_top_airing_anime.dart';

part 'top_airing_event.dart';
part 'top_airing_state.dart';

class TopAiringBloc extends Bloc<TopAiringEvent, TopAiringState> {
  final FetchTopAiringAnime fetchTopAiringAnime;
  TopAiringBloc({required this.fetchTopAiringAnime})
      : super(TopAiringInitial()) {
    on<TopAiringEvent>((event, emit) async {
      if (event is FetchTopAiringAnimeEvent) {
        print('top-airing bloc called');
        emit(TopAiringLoading());
        final either = await fetchTopAiringAnime();
        either.fold((l) => emit(TopAiringError(message: l.message)),
            (anime) => emit(TopAiringLoaded(anime: anime)));
      }
    });
  }
}
