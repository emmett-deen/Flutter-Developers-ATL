import 'package:flutter_developers_atl/domain/models/model.dart';

class MeetupEvent extends Model {
  final String title;
  final String description;
  final String link;
  final String location;
  final String dateTime;
  final String attending;

  MeetupEvent({
    required this.title,
    required this.description,
    required this.link,
    required this.location,
    required this.dateTime,
    required this.attending,
    String? id,
  }) : super(id: id);

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJSON() {
    throw UnimplementedError();
  }
}
