// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'info_bloc.dart';

abstract class InfoEvent extends Equatable {
  const InfoEvent();

  @override
  List<Object> get props => [];
}

class FetchAnimeInfoEvent extends InfoEvent {
  final String id;
  const FetchAnimeInfoEvent({
    required this.id,
  });
}
