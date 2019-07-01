import 'package:built_value/built_value.dart';
import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/state/user.dart';

part 'users_state.g.dart';

abstract class UsersState implements Built<UsersState, UsersStateBuilder> {

  @nullable
  List<User> get users;

  LoadingStatus get loadingStatus;

  UsersState._();
//  factory UsersState([void Function(UsersStateBuilder) updates]) = _$UsersState;
  factory UsersState() => _$UsersState._(loadingStatus: LoadingStatus.Initial);
}