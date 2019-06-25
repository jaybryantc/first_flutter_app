import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:first_flutter_app/state/serializers.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  static Serializer<AppState> get serializer => _$appStateSerializer;

  @nullable
  User get currentUser;

  @nullable
  BuiltList<User> get userList;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

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