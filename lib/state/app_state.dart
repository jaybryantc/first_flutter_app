import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:first_flutter_app/state/register_state.dart';
import 'package:first_flutter_app/state/serializers.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:first_flutter_app/state/users_state.dart';

import 'auth_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  static Serializer<AppState> get serializer => _$appStateSerializer;

  AuthState get authState;
  UsersState get usersState;
  RegisterState get registerState;

  AppState._();
  factory AppState() => _$AppState._(authState: new AuthState(), usersState: new UsersState(), registerState: new RegisterState());

  static AppState fromJson(String json) {
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