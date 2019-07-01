import 'package:first_flutter_app/state/user.dart';

class ValidateUsername {
  final String username;
  ValidateUsername(this.username);
}

class ValidatePassword {
  final String password;
  ValidatePassword(this.password);
}

class UsernameError {
  final String usernameError;
  UsernameError(this.usernameError);
}

class PasswordError {
  final String passwordError;
  PasswordError(this.passwordError);
}

class LoginSuccessful {
  final User user;
  LoginSuccessful(this.user);
}

class ChangeLoginButtonLabel {
  final String buttonLabel;
  ChangeLoginButtonLabel(this.buttonLabel);
}

class GoToUserList {
  GoToUserList();
}

class GoToRegister {
  GoToRegister();
}

class LogOut {
  LogOut();
}
