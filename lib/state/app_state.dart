import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:first_flutter_app/state/user.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  static Serializer<AppState> get serializer => _$appStateSerializer;

  User currentUser;

  BuiltList<User> userList;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}