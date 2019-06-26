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

class LoginSuccessful {
  final User user;
  LoginSuccessful(this.user);
}

class LoginUnsuccessful {
  final String error;
  LoginUnsuccessful(this.error);
}
