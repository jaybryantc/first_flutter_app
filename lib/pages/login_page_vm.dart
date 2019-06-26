import 'dart:async';
import 'package:first_flutter_app/http/endpoints.dart';
import 'package:first_flutter_app/http/requests.dart';
import 'package:first_flutter_app/pages/login_page.dart';
import 'package:first_flutter_app/pages/register_page.dart';
import 'package:first_flutter_app/pages/user_list_page.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPageViewModel {

  LoginPageState _state;

  bool _hasError1 = true, _hasError2 = true;

  final _usernameController = StreamController<String>.broadcast();
  Sink<String> get username => _usernameController;

  final _passwordController = StreamController<String>.broadcast();
  Sink<String> get password => _passwordController;

  final _loginButtonController = StreamController<String>.broadcast();
  Sink<String> get buttonLabel => _loginButtonController;

  Stream<String> get buttonLabelStream => _loginButtonController.stream;

  Stream<String> get usernameError => _usernameController.stream.map((text) {
    usernameValue = text;
    return text.isEmpty ? "Please enter your username" : null;
  });

  Stream<String> get passwordError => _passwordController.stream.map((text){
    passwordValue = text;
    return text.isEmpty ? "Please enter your password" : null;
  });

  String usernameValue, passwordValue;

  LoginPageViewModel({LoginPageState state}) {
    usernameError.listen((error){
      _hasError1 = error != null;
    });
    passwordError.listen((error){
      _hasError2 = error != null;
    });

    this._state = state;
  }

  void login(BuildContext context) {
    if (_hasError1) username.add("");

    if (_hasError2) password.add("");

    if (!_hasError1 && !_hasError2) {
      buttonLabel.add("Logging in...");
      Requests.call(Endpoints.LOGIN, onSuccess: (response) {
        Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => UserListPage()));
      }, onError: (error) {
        buttonLabel.add("Login");
        _state?.showErrorDialog(context);
      });
    }
  }

  void gotoRegister(BuildContext context) {
    Navigator.pushNamed(context, RegisterPage.ROUTE_NAME);
  }

}