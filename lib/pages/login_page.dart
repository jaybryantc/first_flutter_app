
import 'package:first_flutter_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static final String ROUTE_NAME = "/login";
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String usernameError=null, passwordError=null;

  void gotoRegister() {
    Navigator.pushNamed(context, RegisterPage.ROUTE_NAME);
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
            TextField(
              decoration: InputDecoration(
                hintText: "Type your username here",
                labelText: "Username",
                errorText: usernameError,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Username $text');
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Type your password here",
                labelText: "Password",
                errorText: passwordError,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Password $text');
              },
            ),
            FlatButton(
                onPressed: () {
                  print("Login button is pressed.");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Login")
                  ],
                )
            ),
            FlatButton(
                onPressed: gotoRegister,
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