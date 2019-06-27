import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:first_flutter_app/state/serializers.dart';
import 'package:first_flutter_app/state/user.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {

  static Serializer<AuthState> get serializer => _$authStateSerializer;

  @nullable
  User get currentUser;

  @nullable
  String get username;

  @nullable
  String get password;

  @nullable
  String get usernameError;

  @nullable
  String get passwordError;

  String get loginButtonLabel;

  @nullable
  String get loginError;

  AuthState._();
//  factory AuthState([void Function(AuthStateBuilder) updates]) = _$AuthState;
  factory AuthState() => _$AuthState._(loginButtonLabel: "Login");

  static AuthState fromJson(String json) {
    final standardSerializers = (serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
    ).build();
    return standardSerializers.deserialize(jsonDecode(json));
  }

  String toJson() {
    final standardSerializers = (serializers.toBuilder() ..addPlugin(StandardJsonPlugin())
    ).build();
    return jsonEncode(standardSerializers.serialize(this));
  }
}