// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:anime_hi/domain/entity/info_entity.dart';
import 'package:anime_hi/domain/usecase/fetch_anime_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final FetchAnimeInfo fetchAnimeInfo;
  InfoBloc(
    this.fetchAnimeInfo,
  ) : super(InfoInitial()) {
    on<InfoEvent>((event, emit) async {
      if (event is FetchAnimeInfoEvent) {
        emit(InfoLoading());
        final either = await fetchAnimeInfo(id: event.id);
        either.fold((l) => emit(InfoError(message: l.message)),
            (info) => emit(InfoLoaded(info: info)));
      }
    });
  }
}
