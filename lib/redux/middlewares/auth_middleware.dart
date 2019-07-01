
import 'package:first_flutter_app/enums/register_field.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:redux/redux.dart';

class AuthMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {


    if (action is ValidateUsername) {
      validateUsername(action.username, next);
    }

    if (action is ValidatePassword) {
      validatePassword(action.password, next);
    }

    if (action is CheckIfEmptyOrNull) {
      checkIfEmptyOrNull(action.content, action.field, next);
    }

    if (action is MatchPassword) {
      matchPassword(action.password, action.retypePassword, next);
    }

    next(action);
  }

  void validateUsername(String username, NextDispatcher next) {
    if (username.isEmpty) {
      next(UsernameError("Invalid Username."));
    } else {
      next(UsernameError(null));
    }
  }

  void validatePassword(String password, NextDispatcher next) {
    if (password.isEmpty) {
      next(PasswordError("Invalid Password."));
    } else {
      next(PasswordError(null));
    }

  }

  void checkIfEmptyOrNull(String text, RegisterFieldType field, NextDispatcher next) {
    if (text == null || text.isEmpty) {
      next(UpdateErrors(field.field, 'Invalid ${field.value}.'));
    } else {
      next(UpdateErrors(field.field, null));
    }
  }

  void matchPassword(String password, String retypePassword, NextDispatcher next) {
    if (retypePassword != null && password != retypePassword) {
      next(UpdateErrors(
          RegisterField.RETYPE_PASSWORD, "Passwords not match."));
    } else {
      next(UpdateErrors(RegisterField.RETYPE_PASSWORD, null));
    }
  }

}
