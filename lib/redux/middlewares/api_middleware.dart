import 'dart:convert';

import 'package:first_flutter_app/enums/LoadingStatus.dart';
import 'package:first_flutter_app/http/endpoints.dart';
import 'package:first_flutter_app/http/requests.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/redux/actions/users_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:redux/redux.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {

    if (action is Login) {
      login(action.username, action.password, next);
    }

    if (action is Register) {

    }

    if (action is GetUserList) {
      getUserList(next);
    }

    next(action);
  }

  void login(String username, String password, NextDispatcher next) {
    if (username == null || username.isEmpty) {
      next(UsernameError("Invalid Username."));
    }

    if (password == null || password.isEmpty) {
      next(PasswordError("Invalid Password."));
    } else {
      next(ClearErrors());
      next(ChangeLoginButtonLabel("Logging in..."));
      Requests.call(Endpoints.LOGIN, onSuccess: (response) {
        next(LoginSuccessful(User.fromJson(response)));
        next(GoToUserList());
      }, onError: (error) {
        next(ApiError(error.toString()));
      });
    }

  }

  void register() {
    
  }
  
  void getUserList(NextDispatcher next) {
    next(SetLoadingStatus(LoadingStatus.Loading));
    Requests.call(Endpoints.USERS, onSuccess: (response) {
      print(response);
      List<User> users = (json.decode(response) as List).map((element) => User.fromJson(jsonEncode(element))).toList();
      next(SaveUserList(users));
      next(SetLoadingStatus(LoadingStatus.Initial));
    }, onError: (error) {
      next(ApiError(error));
    });
  }

}