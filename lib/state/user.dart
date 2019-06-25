import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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
}