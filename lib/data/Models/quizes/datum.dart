import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final String? id;
  final String? name;
  final String? course;
  final String? topic;
  final DateTime? dueDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Datum({
    this.id,
    this.name,
    this.course,
    this.topic,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        course: data['course'] as String?,
        topic: data['topic'] as String?,
        dueDate: data['dueDate'] == null
            ? null
            : DateTime.parse(data['dueDate'] as String),
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        'course': course,
        'topic': topic,
        'dueDate': dueDate?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    String? id,
    String? name,
    String? course,
    String? topic,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      course: course ?? this.course,
      topic: topic ?? this.topic,
      dueDate: dueDate ?? this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      course,
      topic,
      dueDate,
      createdAt,
      updatedAt,
    ];
  }
}
