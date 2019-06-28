import 'package:first_flutter_app/enums/LoadingStatus.dart';

class Login {
  final String username;
  final String password;

  Login(this.username, this.password);
}

class Register {
  final String username;
  final String password;
  final String retypePassword;
  final String fullname;
  final String company;
  final DateTime birthDate;

  Register(this.username, this.password, this.retypePassword, this.fullname, this.company, this.birthDate);
}

class GetUserList {
  GetUserList();
}

class ApiError {
  final String error;
  ApiError(this.error);
}

class SetLoadingStatus {
  final LoadingStatus status;
  SetLoadingStatus(this.status);
}