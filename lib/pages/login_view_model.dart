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
    this.goToRegister
  });


  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      username: store.state.authState.username,
      password: store.state.authState.password,
      usernameError: store.state.authState.usernameError,
      passwordError: store.state.authState.passwordError,
      buttonLabel: store.state.authState.loginButtonLabel,
      validateUsername: (username) => store.dispatch(new ValidateUsername(username)),
      validatePassword: (password) => store.dispatch(new ValidatePassword(password)),
      login: () => store.dispatch(new Login(store.state.authState.username, store.state.authState.password)),
      goToUserList: () => store.dispatch(new GoToUserList()),
      goToRegister: () => store.dispatch(new GoToRegister())
    );
  }

}