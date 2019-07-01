import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/state/serializers.dart';

import 'iso_8601_date_time_serializer.dart';

part 'register_state.g.dart';

abstract class RegisterState implements Built<RegisterState, RegisterStateBuilder> {

  static Serializer<RegisterState> get serializer => _$registerStateSerializer;

  @nullable String get username;
  @nullable String get password;
  @nullable String get retypePassword;
  @nullable String get fullname;
  @nullable String get company;
  @nullable String get address;
  @nullable DateTime get birthDate;

  @nullable String get usernameError;
  @nullable String get passwordError;
  @nullable String get retypePasswordError;
  @nullable String get fullnameError;
  @nullable String get companyError;
  @nullable String get addressError;
  @nullable String get birthdateError;

  LoadingStatus get loadingStatus;

  RegisterState._();
//  factory RegisterState([void Function(RegisterStateBuilder) updates]) = _$RegisterState;
  factory RegisterState() => _$RegisterState._(loadingStatus: LoadingStatus.Initial);

  static RegisterState fromJson(String json) {
    final standardSerializers = (serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin())
    ).build();
    return standardSerializers.deserialize(jsonDecode(json), specifiedType: FullType(RegisterState));
  }

  String toJson() {
    final standardSerializers = (serializers.toBuilder() ..addPlugin(StandardJsonPlugin())
    ).build();
    return jsonEncode(standardSerializers.serialize(this));
  }
}
