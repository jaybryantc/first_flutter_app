import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/auth_state.dart';
import 'package:redux/redux.dart';

class AuthMiddleware extends MiddlewareClass<AuthState> {

  @override
  void call(Store<AuthState> store, action, NextDispatcher next) {
    switch(action) {
      case Login:
        login(action.username, action.password, next);
        break;
      case ValidateUsername:
        validateUsername(action.username, next);
        break;
      case ValidatePassword:
        validatePassword(action.password, next);
        break;
    }
  }

  void login(String username, String password, NextDispatcher next) {
    if (username.isEmpty) {
    }

    if (password.isEmpty) {
      return;
    }




  }

  void validateUsername(String username, NextDispatcher next) {
    if (username.isEmpty) {

    }
  }

  void validatePassword(String password, NextDispatcher next) {
    if (password.isEmpty) {

    }
  }

}
