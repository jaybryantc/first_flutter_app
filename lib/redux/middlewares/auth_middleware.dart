import 'package:first_flutter_app/http/endpoints.dart';
import 'package:first_flutter_app/http/requests.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
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
//    switch(action) {
//      case Login:
//        login(action.username, action.password, next);
//        break;
//      case ValidateUsername:
//        validateUsername(action.username, next);
//        break;
//      case ValidatePassword:
//        validatePassword(action.password, next);
//        break;
//    }

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

}
