import 'package:first_flutter_app/state/user.dart';

class Login {
  final String username;
  final String password;
  Login(this.username, this.password);
}

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

class LoginUnsuccessful {
  final String error;
  LoginUnsuccessful(this.error);
}

class LoggingIn {
  final String buttonLabel;
  LoggingIn(this.buttonLabel);
}

class GoToUserList {
  GoToUserList();
}

class GoToRegister {
  GoToRegister();
}

class ClearErrors {
  ClearErrors();
}