import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  static final String ROUTE_NAME = "/register";
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  DateTime _birthDate;

  void selectBirthDate() async {
    DateTime selectedDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    _birthDate = selectedDate ?? _birthDate;
  }

  String getBirthDateString() => DateFormat('MMM-dd-yyyy').format(_birthDate);

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
                errorText: null,
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
                errorText: null,
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
                errorText: null,
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
                errorText: null,
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
                errorText: null,
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
                errorText: null,
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
                    Text(_birthDate != null ? 'Birth Date : ' + getBirthDateString() : "Click to select your Birth Date")
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