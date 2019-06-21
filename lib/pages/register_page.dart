import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  static final String ROUTE_NAME = "/register";
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String usernameError = null;
  String passwordError = null;
  String password2Error = null;
  String fullNameError = null;
  String companyError = null;
  String addressError = null;

  DateTime birthDate = null;


  void selectBirthDate() async {
    DateTime selectedDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    setState(() {
      birthDate = selectedDate ?? birthDate;
    });
  }

  String getBirthDateString() => DateFormat('MMM-dd-yyyy').format(birthDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Scrollbar(
        child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
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
              obscureText: true,
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Retype your password",
                labelText: "Verify your password",
                errorText: password2Error,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Password 2 $text');
              },
              obscureText: true,
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Type your full name here",
                labelText: "Full Name",
                errorText: fullNameError,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Full Name $text');
              },
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Type your company name here",
                labelText: "Company",
                errorText: companyError,
              ),
              maxLines: 1,
              onChanged: (text) {
                print('Company $text');
              },
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "Type your address here",
                labelText: "Address",
                errorText: addressError,
              ),
              minLines: 1,
              maxLines: 3,
              onChanged: (text) {
                print('Company $text');
              },
            ),

            FlatButton(
                onPressed: selectBirthDate,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(birthDate != null ? 'Birth Date : ' + getBirthDateString() : "Click to select your Birth Date")
                  ],
                )
            ),

            FlatButton(
                onPressed: () {
                  print("Register button is pressed.");
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
      ),
    );
  }

}