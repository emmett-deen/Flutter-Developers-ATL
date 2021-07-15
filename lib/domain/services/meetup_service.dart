import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/meetup_event.dart';
import 'package:universal_html/parsing.dart';
import 'package:webfeed/webfeed.dart';

import '../../constants.dart';

class MeetupService {
  Future<Either<Failure, MeetupEvent>> nextEvent() async {
    var callable = FirebaseFunctions.instance.httpsCallable('meetupGetData');
    try {
      var rss = RssFeed.parse((await callable.call()).data);
      var nextEvent = rss.items?.first;
      var html = parseHtmlDocument(nextEvent?.description ?? '');
      log.d(html.childNodes.first.childNodes[1].childNodes
          .map((e) => e.toString())
          .toString());
      var contentNodes = html.childNodes.first.childNodes[1].childNodes;
      var title = '';
      var description = '';
      var link = '';
      var attending = '';
      var location = '';
      var dateTime = '';
      var validNodes = contentNodes
          .where((element) =>
              element.text != null &&
              element.text!.replaceAll(' ', '').isNotEmpty &&
              element.text! != '\n')
          .toList();

      title = validNodes[0].text ?? '';
      location = validNodes[validNodes.length - 4].text ?? '';
      dateTime = validNodes[validNodes.length - 3].text ?? '';
      attending = validNodes[validNodes.length - 2].text ?? '';
      link = validNodes[validNodes.length - 1].text ?? '';

      for (var i = 1; i < validNodes.length - 4; i++) {
        log.v('$i ${validNodes[i].text}');
        if (description.isNotEmpty) {
          description += '\n';
        }
        description += validNodes[i].text ?? '';
      }

      log.d(
          '$title \n- $description \n- $link \n- $attending \n- $location \n- $dateTime');
      return Right(MeetupEvent(
          title: title,
          description: description,
          link: link,
          location: location,
          dateTime: dateTime,
          attending: attending));
    } catch (e, stacktrace) {
      var failure = ServerFailure();
      log.e(failure.errorMessage, [e, stacktrace]);
      return Left(failure);
    }
  }
}
