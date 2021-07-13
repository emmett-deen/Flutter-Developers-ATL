import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/meetup_event.dart';
import 'package:webfeed/webfeed.dart';

import '../../constants.dart';

class MeetupService {

  Future<Either<Failure, MeetupEvent>> nextEvent() async {
    var callable = FirebaseFunctions.instance.httpsCallable('meetupGetData');
    try {
      var rss = RssFeed.parse((await callable.call()).data);
      var nextEvent = rss.items?.first;
      return Right(MeetupEvent(htmlData: nextEvent?.description ?? ''));
    } catch (e, stacktrace) {
      var failure = ServerFailure();
      log.e(failure.errorMessage, [e, stacktrace]);
      return Left(failure);
    }
  }
}
