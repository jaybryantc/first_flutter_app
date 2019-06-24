
import 'dart:async';

import 'package:first_flutter_app/pages/register_page.dart';
import 'package:first_flutter_app/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final String ROUTE_NAME = "/login";
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  LoginPageViewModel _loginPageViewModel = new LoginPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            StreamBuilder<String> (
              stream: _loginPageViewModel.usernameError,
              builder: (context, snapshot) => TextField(
                decoration: InputDecoration(
                  hintText: "Type your username here",
                  labelText: "Username",
                  errorText: snapshot.data,
                ),
                maxLines: 1,
                onChanged: (text) {
                  print('Username $text');
                  _loginPageViewModel.username.add(text);
                },
              ),
            ),

            StreamBuilder<String>(
              stream: _loginPageViewModel.passwordError,
              builder: (context, snapshot) => TextField(
                decoration: InputDecoration(
                  hintText: "Type your password here",
                  labelText: "Password",
                  errorText: snapshot.data,
                ),
                maxLines: 1,
                onChanged: (text) {
                  print('Password $text');
                  _loginPageViewModel.password.add(text);
                },
                obscureText: true,
              ),
            ),


            FlatButton(
                onPressed: () {
                  _loginPageViewModel.login(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Login")
                  ],
                )
            ),

            FlatButton(
                onPressed: () {
                  _loginPageViewModel.gotoRegister(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Register")
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}

class LoginPageViewModel {
  bool _hasError1 = true, _hasError2;
  
  final _usernameController = StreamController<String>.broadcast();
  Sink<String> get username => _usernameController;

  final _passwordController = StreamController<String>.broadcast();
  Sink<String> get password => _passwordController;

  Stream<String> get usernameError => _usernameController.stream.map((text) => text.isEmpty ? "Please enter your username" : null);

  Stream<String> get passwordError => _passwordController.stream.map((text) => text.isEmpty ? "Please enter your password" : null);

  LoginPageViewModel() {
    usernameError.listen((error){
      _hasError1 = error != null;
    });
    passwordError.listen((error){
      _hasError2 = error != null;
    });
  }
  
  void login(BuildContext context) {
    if (!_hasError1 && !_hasError2) {
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => UserListPage()));
    }
  }

  void gotoRegister(BuildContext context) {
    Navigator.pushNamed(context, RegisterPage.ROUTE_NAME);
  }
}