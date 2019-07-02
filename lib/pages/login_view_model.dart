import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:redux/redux.dart';

class LoginViewModel {
  final String username;
  final String password;
  final String usernameError;
  final String passwordError;
  final String buttonLabel;
  final Function(String) validateUsername;
  final Function(String) validatePassword;
  final Function login;
  final Function goToUserList;
  final Function goToRegister;
  final bool loginEnabled;

  LoginViewModel({
    this.username,
    this.password,
    this.usernameError,
    this.passwordError,
    this.buttonLabel,
    this.validateUsername,
    this.validatePassword,
    this.login,
    this.goToUserList,
    this.goToRegister,
    this.loginEnabled,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      username: store.state.authState.username,
      password: store.state.authState.password,
      usernameError: store.state.authState.usernameError,
      passwordError: store.state.authState.passwordError,
      buttonLabel: store.state.authState.loginButtonLabel,
      validateUsername: (username) => store.dispatch(ValidateUsername(username)),
      validatePassword: (password) => store.dispatch(ValidatePassword(password)),
      login: store.state.authState.loginButtonLabel.toLowerCase() == "login" ?
          () => store.dispatch(Login(store.state.authState.username, store.state.authState.password)) : null,
      goToUserList: () => store.dispatch(GoToUserList()),
      goToRegister: () => store.dispatch(GoToRegister()),
      loginEnabled: store.state.authState.loginButtonLabel.toLowerCase() == "login",
    );
  }

}