import 'package:first_flutter_app/pages/login_view_model.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';


// TODO: only use stateful widgets if you necessarily need setState method or initializing heavy calculations
class LoginPage extends StatefulWidget {
  static final String ROUTE_NAME = "/login";
  @override
  State<StatefulWidget> createState() => LoginPageState();

}


// TODO: in the future, state class should be private. e.g _LoginPageState
class LoginPageState extends State<LoginPage> {

// TODO: not used... so use stateful widget
  @override
  void initState() {
    super.initState();
  }

  void showErrorDialog(BuildContext context) {
    showDialog(context: context, barrierDismissible: true, builder: (BuildContext context) => AlertDialog(
      title: Text("Error"),
      content: Text("Something went wrong."),
      actions: <Widget>[ // TODO: no need to explicitly cast it to <Widget>
        FlatButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("Ok"),)
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
// TODO: avoid extra spaces
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20), // for values like this that don't change dynamically, use const
        child: StoreConnector<AppState, LoginViewModel>(
          onInit: (store) {}, // TODO: remove init if not used
          builder: (context, viewModel) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
// TODO: avoid extra spaces
              TextField(
                enabled: viewModel.buttonLabel.toLowerCase() == "login", // TODO: logic should be inside vm
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
// TODO: extra space 
              TextField(
                enabled: viewModel.buttonLabel.toLowerCase() == "login", // TODO: should be inside vm
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
// TODO: extra space
              RaisedButton(
                  onPressed: viewModel.buttonLabel.toLowerCase() == "login" ? viewModel.login : null, // TODO: login inside vm
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ // No need to explicitly declare <widget>
                      Text(viewModel.buttonLabel)
                    ],
                  )
              ),
// TODO: extra space
              FlatButton(
                  onPressed: () { // TODO: you could use ()=>
                    viewModel.goToRegister();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ // TODO: remove <Widget>
                      Text("Register")
                    ],
                  )
              ),

            ],
          ),
// TODO: extra space
          converter: (store) => LoginViewModel.fromStore(store),

        ),
      ),
    );
  }
}
