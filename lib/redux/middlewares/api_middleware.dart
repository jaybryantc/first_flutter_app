import 'dart:convert';

import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/enums/register_field.dart';
import 'package:first_flutter_app/http/endpoints.dart';
import 'package:first_flutter_app/http/requests.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/redux/actions/users_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:redux/redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {

    if (action is Login) {
      login(action.username, action.password, next);
    }

    if (action is Register) {
      register(action.username, action.password, action.retypePassword,
          action.fullname, action.company, action.address, action.birthDate,next);
    }

    if (action is GetUserList) {
      getUserList(next);
    }

    next(action);
  }

  void login(String username, String password, NextDispatcher next) {
    bool hasError = false;
    if (username == null || username.isEmpty) {
      hasError = true;
      next(UsernameError("Invalid Username."));
    }

    if (password == null || password.isEmpty) {
      hasError = true;
      next(PasswordError("Invalid Password."));
    }

    if (!hasError) {
      next(ChangeLoginButtonLabel("Logging in..."));
      Requests.call(Endpoints.LOGIN, onSuccess: (response) {
        next(LoginSuccessful(User.fromJson(response)));
        next(GoToUserList());
        Fluttertoast.showToast(msg: "Logged in successfully.");
      }, onError: (error) {
        next(ApiError(error.toString()));
        Fluttertoast.showToast(msg: error.toString());
      });
    }

  }

  void register(String username, String password, String retypePassword,
      String fullname, String company, String address, DateTime birthDate,
      NextDispatcher next) {
    bool hasError = false;
    if (username == null || username.isEmpty) {
      hasError = true;
      next(UpdateErrors(RegisterField.USERNAME, "Invalid username."));
    }

    if (password == null || password.isEmpty) {
      hasError = true;
      next(UpdateErrors(RegisterField.PASSWORD, "Invalid password."));
    }

    if (retypePassword == null || retypePassword.isEmpty) {
      hasError = true;
      next(UpdateErrors(RegisterField.RETYPE_PASSWORD, "Invalid password validation."));
    }

    if (password != null && password.isNotEmpty && retypePassword != null && retypePassword.isNotEmpty && password != retypePassword) {
      hasError = true;
      next(UpdateErrors(RegisterField.RETYPE_PASSWORD, "Passwords not match."));
    }

    if (fullname == null || fullname.isEmpty) {
      hasError = true;
      next(UpdateErrors(RegisterField.FULLNAME, "Invalid fullname."));
    }

    if (company == null || company.isEmpty) {
      hasError = true;
      next(UpdateErrors(RegisterField.COMPANY, "Invalid company."));
    }

    if (address == null || address.isEmpty) {
      hasError = true;
      next(UpdateErrors(RegisterField.ADDRESS, "Invalid address."));
    }

    if (birthDate == null) {
      hasError = true;
      next(UpdateErrors(RegisterField.BIRTHDATE, "Select your birthdate."));
    }

    if (!hasError) {
      next(SetLoadingStatus(LoadingStatus.Loading));
      Requests.call(Endpoints.REGISTER, onSuccess: (response) {
        next(SetLoadingStatus(LoadingStatus.Initial));
        next(SuccessfulRegistration());
        Fluttertoast.showToast(msg: "Registered successfully.");
      }, onError: (error) {
        next(SetLoadingStatus(LoadingStatus.Initial));
        next(ApiError(error));
        Fluttertoast.showToast(msg: error.toString());
      });
    }

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
