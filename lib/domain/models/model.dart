import 'package:equatable/equatable.dart';

/// A model represents an object in the database. This abstract
/// class allows us to give a basic structure that all
/// models will have to follow.
abstract class Model extends Equatable {
  final String? id;

  Model({required this.id});

  /// Converts the object into a map
  /// that can be stored and sent as a JSON
  /// string
  Map<String, dynamic> toJSON();
}
