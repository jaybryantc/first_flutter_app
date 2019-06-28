import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:first_flutter_app/state/serializers.dart';
import 'package:first_flutter_app/state/iso_8601_date_time_serializer.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {

  static Serializer<User> get serializer => _$userSerializer;

  int get id;

  String get fullname;

  String get address;

  DateTime get birthdate;

  String get company;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;

  static User fromJson(String json) {
    final standardSerializers = (serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
    ).build();
    return standardSerializers.deserialize(jsonDecode(json), specifiedType: FullType(User));
  }

  String toJson() {
    final standardSerializers = (serializers.toBuilder() ..addPlugin(StandardJsonPlugin())
    ).build();
    return jsonEncode(standardSerializers.serialize(this));
  }
}