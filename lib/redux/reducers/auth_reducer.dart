import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/auth_state.dart';
import 'package:redux/redux.dart';

final auth_reducer = combineReducers<AuthState>([
  TypedReducer<AuthState, Login>(_login),
  TypedReducer<AuthState, ValidateUsername>(_validateUsername),
  TypedReducer<AuthState, ValidatePassword>(_validatePassword),
  TypedReducer<AuthState, UsernameError>(_usernameError),
  TypedReducer<AuthState, PasswordError>(_passwordError),
  TypedReducer<AuthState, LoginSuccessful>(_loginSuccessful),
  TypedReducer<AuthState, LoginUnsuccessful>(_loginUnsuccessful),
  TypedReducer<AuthState, LoggingIn>(_loggingIn),
  TypedReducer<AuthState, GoToUserList>(_goToUserList),
  TypedReducer<AuthState, GoToRegister>(_goToRegister),
  TypedReducer<AuthState, ClearErrors>(_clearErrors),
]);

AuthState _login(AuthState state, action) => state.rebuild((state) {
  state ..username = action.username
      ..password = action.password;
});

AuthState _validateUsername(AuthState state, action) => state.rebuild((state) {
  state ..username = action.username;
});

AuthState _usernameError(AuthState state, action) => state.rebuild((state) {
  state ..usernameError = action.usernameError;
});

AuthState _validatePassword(AuthState state, action) => state.rebuild((state) {
  state ..password = action.password;
});

AuthState _passwordError(AuthState state, action) => state.rebuild((state) {
  state ..passwordError = action.passwordError;
});

AuthState _loginSuccessful(AuthState state, action) => state.rebuild((state) {
  state ..currentUser.replace(action.user);
});

AuthState _loginUnsuccessful(AuthState state, action) => state.rebuild((state) {
  state ..loginButtonLabel = "Login"
      ..loginError = action.error;
});

AuthState _loggingIn(AuthState state, action) => state.rebuild((state) {
  state ..loginButtonLabel = action.buttonLabel;
});

AuthState _goToUserList(AuthState state, action) => state;

AuthState _goToRegister(AuthState state, action) => state;

AuthState _clearErrors(AuthState state, action) => state.rebuild((state) {
  state ..usernameError = null
      ..passwordError = null;
});