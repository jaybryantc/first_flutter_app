import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {

  static Serializer<AppState> get serializer => _$appStateSerializer;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}