import 'package:equatable/equatable.dart';

/// Failures allow us to catch all exceptions in the data layer
/// and force us to deal with them in the presentation layer.
/// A failure contains an [errorMessage] describing what went
/// wrong.
abstract class Failure implements Equatable {
  final String errorMessage;

  Failure({this.errorMessage = 'There was an error.'});

  @override
  List<Object> get props => [errorMessage];

  @override
  bool get stringify => true;
}

class ServerFailure extends Failure {
  ServerFailure(
      {String errorMessage =
          'There was an issue communicating with the server.'})
      : super(errorMessage: errorMessage);
}

class ParseFailure extends Failure {
  ParseFailure({String errorMessage = 'There was an issue parsing data.'})
      : super(errorMessage: errorMessage);
}

class SaveFailure extends Failure {
  SaveFailure(
      {String errorMessage = 'There was an issue updating this object.'})
      : super(errorMessage: errorMessage);
}

class AuthFailure extends Failure {
  AuthFailure({String errorMessage = 'There was an authentication issue.'})
      : super(errorMessage: errorMessage);
}

class StorageFailure extends Failure {
  StorageFailure(
      {String errorMessage =
          'There was an issue communicating with the storage server.'})
      : super(errorMessage: errorMessage);
}

class RoleFailure extends Failure {
  RoleFailure(
      {String errorMessage = 'You do not have permission to access this page.'})
      : super(errorMessage: errorMessage);
}

class InputFailure extends Failure {
  InputFailure({String errorMessage = 'There was an input issue.'})
      : super(errorMessage: errorMessage);
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({String errorMessage = 'There was an unexpected failure.'})
      : super(errorMessage: errorMessage);
}
