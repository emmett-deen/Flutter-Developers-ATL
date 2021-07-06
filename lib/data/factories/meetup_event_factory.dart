import 'package:dartz/dartz.dart';
import 'package:flutter_developers_atl/data/factories/model_factory.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/meetup_event.dart';

import '../../constants.dart';

class MeetupEventFactory extends ModelFactory<MeetupEvent> {
  @override
  Either<Failure, MeetupEvent> fromJSON(Map<String, dynamic>? data) {
    if (data == null) {
      var failure = ParseFailure();
      log.e(failure.errorMessage);
      return Left(failure);
    } else {
      try {
        return Right(MeetupEvent(htmlData: data['html_data']));
      } catch (e, stacktrace) {
        var failure = ParseFailure();
        log.e(failure.errorMessage, [e, stacktrace]);
        return Left(failure);
      }
    }
  }
}
