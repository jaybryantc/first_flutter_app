import 'package:first_flutter_app/redux/reducers/register_reducer.dart';
import 'package:first_flutter_app/redux/reducers/users_reducer.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/redux/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action) => state.rebuild((state) {
  state ..authState.replace(auth_reducer(state.authState.build(), action))
      ..usersState.replace(users_reducer(state.usersState.build(), action))
      ..registerState.replace(register_reducer(state.registerState.build(), action));
});