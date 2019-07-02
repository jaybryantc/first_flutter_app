import 'package:first_flutter_app/pages/login_view_model.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPage extends StatelessWidget {
  static final String ROUTE_NAME = "/login";
  final double padding = 20;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Login"),
    ),
    body: Container(
      padding: EdgeInsets.all(padding),
      child: StoreConnector<AppState, LoginViewModel>(
        builder: (context, viewModel) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              enabled: viewModel.loginEnabled,
              decoration: InputDecoration(
                hintText: "Type your username here",
                labelText: "Username",
                errorText: viewModel.usernameError,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Username $text');
                viewModel.validateUsername(text);
              },
            ),
            TextField(
              enabled: viewModel.loginEnabled,
              decoration: InputDecoration(
                hintText: "Type your password here",
                labelText: "Password",
                errorText: viewModel.passwordError,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Password $text');
                viewModel.validatePassword(text);
              },
              obscureText: true,
            ),
            RaisedButton(
                onPressed: viewModel.login,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.buttonLabel)
                  ],
                )
            ),
            FlatButton(
                onPressed: viewModel.goToRegister,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Register")
                  ],
                )
            ),
          ],
        ),
        converter: (store) => LoginViewModel.fromStore(store),
      ),
    ),
  );
}