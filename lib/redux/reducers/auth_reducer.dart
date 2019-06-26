import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/auth_state.dart';
import 'package:redux/redux.dart';

final auth_reducer = combineReducers<AuthState>([
  TypedReducer<AuthState, Login>(_login),
  TypedReducer<AuthState, ValidateUsername>(_validateUsername),
  TypedReducer<AuthState, ValidatePassword>(_validatePassword),
  TypedReducer<AuthState, LoginSuccessful>(_loginSuccessful),
  TypedReducer<AuthState, LoginUnsuccessful>(_loginUnsuccessful),
]);

AuthState _login(AuthState state, action) => state.rebuild((state) {
  state ..username = action.username
      ..password = action.password;
});

AuthState _validateUsername(AuthState state, action) => state.rebuild((state) {
  state ..username = action.username;
});

AuthState _validatePassword(AuthState state, action) => state.rebuild((state) {
  state ..password = action.password;
});

AuthState _loginSuccessful(AuthState state, action) => state.rebuild((state) {
  state ..currentUser = action.user;
});

AuthState _loginUnsuccessful(AuthState state, action) => state.rebuild((state) {
  state ..loginButtonLabel = "Login"
      ..loginError = action.error;
});
