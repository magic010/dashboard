import 'dart:convert';

import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? role;
  final bool? active;
  final List<dynamic>? wishlist;
  final List<dynamic>? addresses;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Data({
    this.id,
    this.name,
    this.email,
    this.role,
    this.active,
    this.wishlist,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['_id'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        role: data['role'] as String?,
        active: data['active'] as bool?,
        wishlist: data['wishlist'] as List<dynamic>?,
        addresses: data['addresses'] as List<dynamic>?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        v: data['__v'] as int?,
      );

  Map<String, dynamic> toMap() => {
        '_id': id,
        'name': name,
        'email': email,
        'role': role,
        'active': active,
        'wishlist': wishlist,
        'addresses': addresses,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    bool? active,
    List<dynamic>? wishlist,
    List<dynamic>? addresses,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      active: active ?? this.active,
      wishlist: wishlist ?? this.wishlist,
      addresses: addresses ?? this.addresses,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      role,
      active,
      wishlist,
      addresses,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
