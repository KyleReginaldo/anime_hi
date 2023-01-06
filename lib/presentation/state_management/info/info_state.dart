// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class InfoError extends InfoState {
  final String message;
  const InfoError({
    required this.message,
  });
}

class InfoLoaded extends InfoState {
  final InfoEntity info;
  const InfoLoaded({
    required this.info,
  });
}

class InfoLoading extends InfoState {}
