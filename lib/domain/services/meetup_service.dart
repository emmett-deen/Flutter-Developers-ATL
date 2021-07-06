import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_developers_atl/data/factories/meetup_event_factory.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/meetup_event.dart';
import 'package:webfeed/webfeed.dart';

import '../../constants.dart';

class MeetupService {

  Future<Either<Failure, MeetupEvent>> nextEvent() async {
    try {
      var response = await Dio()
          .get('https://www.meetup.com/flutter-developers-atl/events/rss/');
      var rss = RssFeed.parse(response.data);
      var nextEvent = rss.items?.first;
      return Right(MeetupEvent(htmlData: nextEvent?.description ?? ''));
    } catch (e, stacktrace) {
      var failure = ServerFailure();
      log.e(failure.errorMessage, [e, stacktrace]);
      return Left(failure);
    }
  }
}
