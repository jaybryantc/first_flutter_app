library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';

part 'serializers.g.dart';

@SerializersFor(const [AppState, User])

Serializers serializers =  _$serializers;