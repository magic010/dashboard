import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class Login extends Equatable {
  final Data? data;
  final String? token;

  const Login({this.data, this.token});

  factory Login.fromMap(Map<String, dynamic> data) => Login(
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Login].
  factory Login.fromJson(String data) {
    return Login.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Login] to a JSON string.
  String toJson() => json.encode(toMap());

  Login copyWith({
    Data? data,
    String? token,
  }) {
    return Login(
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, token];
}
