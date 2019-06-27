import 'package:first_flutter_app/pages/register_page.dart';
import 'package:first_flutter_app/pages/user_list_page.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';

import '../../main.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, action, NextDispatcher next) {

    if (action is GoToUserList) {
      MyApp.navKey.currentState.pushReplacement(new MaterialPageRoute(builder: (context) => UserListPage()));
    }


    if (action is GoToRegister) {
      MyApp.navKey.currentState.pushNamed(RegisterPage.ROUTE_NAME);
    }

    next(action);
  }

}