import 'package:flutter/material.dart';
import 'login_page_vm.dart';

class LoginPage extends StatefulWidget {
  static final String ROUTE_NAME = "/login";
  @override
  State<StatefulWidget> createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {
  LoginPageViewModel _loginPageViewModel;

  @override
  void initState() {
    super.initState();
    _loginPageViewModel = new LoginPageViewModel(state: this);
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

            StreamBuilder<String>(
              stream: _loginPageViewModel.buttonLabelStream,
              builder: (context, snapshot) => FlatButton(
                  onPressed: () {
                    _loginPageViewModel.login(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data ?? "Login")
                    ],
                  )
              ),
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
