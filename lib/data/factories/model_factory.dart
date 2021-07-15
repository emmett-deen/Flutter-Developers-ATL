
import 'package:dartz/dartz.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/model.dart';

import '../../constants.dart';

/// A [ModelFactory] allows us to create a [Model] from json data
/// This handles all parsing, localizing of dates, etc..
abstract class ModelFactory<T extends Model> {
  /// This method returns either a [Failure] or [T] from [data]
  Either<Failure, T> fromJSON(Map<String, dynamic>? data);

  Either<Failure, T> saveWith(
      {required T object, required String variable, required dynamic value}) {
    log.i(
        '${T.runtimeType.toString()}.saveWith: \n\tVariable: $variable \n\tValue: $value');
    var json = object.toJSON();
    json[variable] = value;
    var result = fromJSON(json).fold((l) => SaveFailure(), (r) => r);
    if (result is Failure) {
      return Left(result);
    } else if (result is T) {
      return Right(result);
    } else {
      return Left(UnexpectedFailure());
    }
  }
}
