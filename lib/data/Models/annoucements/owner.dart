import 'dart:convert';

import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  final String? id;
  final String? name;

  const Owner({this.id, this.name});

  factory Owner.fromMap(Map<String, dynamic> data) => Owner(
        id: data['_id'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Owner].
  factory Owner.fromJson(String data) {
    return Owner.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Owner] to a JSON string.
  String toJson() => json.encode(toMap());

  Owner copyWith({
    String? id,
    String? name,
  }) {
    return Owner(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name];
}
