import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'pagination_result.dart';

class Quizes extends Equatable {
  final int? results;
  final PaginationResult? paginationResult;
  final List<Datum>? data;

  const Quizes({this.results, this.paginationResult, this.data});

  factory Quizes.fromMap(Map<String, dynamic> data) => Quizes(
        results: data['results'] as int?,
        paginationResult: data['paginationResult'] == null
            ? null
            : PaginationResult.fromMap(
                data['paginationResult'] as Map<String, dynamic>),
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'results': results,
        'paginationResult': paginationResult?.toMap(),
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Quizes].
  factory Quizes.fromJson(String data) {
    return Quizes.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Quizes] to a JSON string.
  String toJson() => json.encode(toMap());

  Quizes copyWith({
    int? results,
    PaginationResult? paginationResult,
    List<Datum>? data,
  }) {
    return Quizes(
      results: results ?? this.results,
      paginationResult: paginationResult ?? this.paginationResult,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [results, paginationResult, data];
}
