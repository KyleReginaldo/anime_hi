// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class Failure {
  final String message;
  Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
