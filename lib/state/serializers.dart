library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:first_flutter_app/state/users_state.dart';
import 'auth_state.dart';

part 'serializers.g.dart';

@SerializersFor(const [AppState, AuthState, UsersState, User])

Serializers serializers =  _$serializers;