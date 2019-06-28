import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/users_actions.dart';
import 'package:first_flutter_app/state/users_state.dart';
import 'package:redux/redux.dart';

final users_reducer = combineReducers<UsersState>([
  TypedReducer<UsersState, SaveUserList>(_saveUsers),
  TypedReducer<UsersState, SetLoadingStatus>(_setLoadingStatus),
]);

UsersState _saveUsers(UsersState state, action) => state.rebuild((state) {
  state ..users = action.users;
});

UsersState _setLoadingStatus(UsersState state, action) => state.rebuild((state) {
  state ..loadingStatus = action.status;
});
