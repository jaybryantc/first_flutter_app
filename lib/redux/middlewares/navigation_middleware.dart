import 'package:first_flutter_app/pages/login_page.dart';
import 'package:first_flutter_app/pages/register_page.dart';
import 'package:first_flutter_app/pages/user_list_page.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';

import '../../main.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {

    if (action is GoToUserList) {
      MyApp.navKey.currentState.pushReplacementNamed(UserListPage.ROUTE_NAME);
    }


    if (action is GoToRegister) {
      MyApp.navKey.currentState.pushNamed(RegisterPage.ROUTE_NAME);
    }

    if (action is SuccessfulRegistration) {
      MyApp.navKey.currentState.pop();
    }

    if (action is LogOut) {
      MyApp.navKey.currentState.pushReplacementNamed(LoginPage.ROUTE_NAME);
    }

    next(action);
  }
}