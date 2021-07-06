import 'package:flutter_developers_atl/domain/models/model.dart';

class MeetupEvent extends Model {
  final String htmlData;

  MeetupEvent({String? id, required this.htmlData}) : super(id: id);

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
    };
  }
}
