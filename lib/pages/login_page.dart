import 'package:first_flutter_app/pages/login_view_model.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginPage extends StatefulWidget {
  static final String ROUTE_NAME = "/login";
  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  void showErrorDialog(BuildContext context) {
    showDialog(context: context, barrierDismissible: true, builder: (BuildContext context) => AlertDialog(
      title: Text("Error"),
      content: Text("Something went wrong."),
      actions: <Widget>[
        FlatButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("Ok"),)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: StoreConnector<AppState, LoginViewModel>(
          onInit: (store) => {

          },
          builder: (context, viewModel) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              TextField(
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

              FlatButton(
                  onPressed: viewModel.buttonLabel.toLowerCase() == "login" ? viewModel.login : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(viewModel.buttonLabel)
                    ],
                  )
              ),

              FlatButton(
                  onPressed: () {
                    viewModel.goToRegister();
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
          
          converter: (store) => LoginViewModel.fromStore(store),

        ),
      ),
    );
  }
}
