import 'package:first_flutter_app/enums/register_field.dart';

class CheckIfEmptyOrNull {
  final String content;
  final RegisterFieldType field;
  CheckIfEmptyOrNull(this.content, this.field);
}

class RegisterFieldType {
  final RegisterField field;
  final String value;
  RegisterFieldType(this.field, this.value);
}

class MatchPassword {
  final String password;
  final String retypePassword;
  MatchPassword(this.password, this.retypePassword);
}

class UpdateErrors {
  final RegisterField field;
  final String error;
  UpdateErrors(this.field, this.error);
}

class UpdateBirthDate {
  final DateTime birthDate;
  UpdateBirthDate(this.birthDate);
}

class ResetRegister {
  ResetRegister();
}

class SuccessfulRegistration {
  SuccessfulRegistration();
}

class UnsuccessfulRegistration {
  UnsuccessfulRegistration();
}