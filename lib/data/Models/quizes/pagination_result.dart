import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaginationResult extends Equatable {
  final int? currentPage;
  final int? limit;
  final int? numberOfPages;

  const PaginationResult({
    this.currentPage,
    this.limit,
    this.numberOfPages,
  });

  factory PaginationResult.fromMap(Map<String, dynamic> data) {
    return PaginationResult(
      currentPage: data['currentPage'] as int?,
      limit: data['limit'] as int?,
      numberOfPages: data['numberOfPages'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'currentPage': currentPage,
        'limit': limit,
        'numberOfPages': numberOfPages,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaginationResult].
  factory PaginationResult.fromJson(String data) {
    return PaginationResult.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaginationResult] to a JSON string.
  String toJson() => json.encode(toMap());

  PaginationResult copyWith({
    int? currentPage,
    int? limit,
    int? numberOfPages,
  }) {
    return PaginationResult(
      currentPage: currentPage ?? this.currentPage,
      limit: limit ?? this.limit,
      numberOfPages: numberOfPages ?? this.numberOfPages,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [currentPage, limit, numberOfPages];
}
