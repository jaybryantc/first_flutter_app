import 'dart:async';

import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/enums/register_field.dart';
import 'package:first_flutter_app/pages/register_view_model.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  static final String ROUTE_NAME = "/register";
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  void selectBirthDate(RegisterViewModel viewModel) async {
     DateTime selectedDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
     if (selectedDate != null) {
       viewModel.updateBirthDate(selectedDate);
     }
  }

  String getBirthDateString(DateTime birthDate) => DateFormat('MMM-dd-yyyy').format(birthDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Scrollbar(
        child: StoreConnector<AppState, RegisterViewModel>(
          onInit: (store) {
            store.dispatch(ResetRegister());
          },
          
          builder: (context, viewModel){
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[

                  TextField(
                    enabled: viewModel.loadingStatus == LoadingStatus.Initial,
                    decoration: InputDecoration(
                      hintText: "Type your username here",
                      labelText: "Username",
                      errorText: viewModel.usernameError,
                    ),
                    maxLines: 1,
                    onChanged: (text) {
                      print('Username $text');
                      viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.USERNAME, "username"));
                    },
                  ),

                  TextField(
                    enabled: viewModel.loadingStatus == LoadingStatus.Initial,
                    decoration: InputDecoration(
                      hintText: "Type your password here",
                      labelText: "Password",
                      errorText: viewModel.passwordError,
                    ),
                    maxLines: 1,
                    onChanged: (text) {
                      print('Password $text');
                      viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.PASSWORD, "password"));

                    },
                    obscureText: true,
                  ),

                  TextField(
                    enabled: viewModel.loadingStatus == LoadingStatus.Initial,
                    decoration: InputDecoration(
                      hintText: "Retype your password",
                      labelText: "Verify your password",
                      errorText: viewModel.retypePasswordError,
                    ),
                    maxLines: 1,
                    onChanged: (text) {
                      print('Password 2 $text');
                      if (text.isEmpty) {
                        viewModel.checkIfNotEmpty(text, RegisterFieldType(
                            RegisterField.RETYPE_PASSWORD,
                            "password validation"));
                      } else {
                        viewModel.matchPassword(viewModel.password, text);
                      }
                    },
                    obscureText: true,
                  ),

                  TextField(
                    enabled: viewModel.loadingStatus == LoadingStatus.Initial,
                    decoration: InputDecoration(
                      hintText: "Type your full name here",
                      labelText: "Full Name",
                      errorText: viewModel.fullnameError,
                    ),
                    maxLines: 1,
                    onChanged: (text) {
                      print('Full Name $text');
                      viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.FULLNAME, "full name"));
                    },
                  ),

                  TextField(
                    enabled: viewModel.loadingStatus == LoadingStatus.Initial,
                    decoration: InputDecoration(
                      hintText: "Type your company name here",
                      labelText: "Company",
                      errorText: viewModel.companyError,
                    ),
                    maxLines: 1,
                    onChanged: (text) {
                      print('Company $text');
                      viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.COMPANY, "company"));
                    },
                  ),

                  TextField(
                    enabled: viewModel.loadingStatus == LoadingStatus.Initial,
                    decoration: InputDecoration(
                      hintText: "Type your address here",
                      labelText: "Address",
                      errorText: viewModel.addressError,
                    ),
                    minLines: 1,
                    maxLines: 3,
                    onChanged: (text) {
                      print('Company $text');
                      viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.ADDRESS, "address"));
                    },
                  ),

                  FlatButton(
                      onPressed: viewModel.loadingStatus == LoadingStatus.Initial ? () => selectBirthDate(viewModel) : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(viewModel.birthDate != null ? 'Birth Date : ' + getBirthDateString(viewModel.birthDate) : "Click to select your Birth Date")
                        ],
                      )
                  ),

                  Text(viewModel.birthdateError ?? "", style: TextStyle(color: Colors.red, ),),

                  RaisedButton(
                      onPressed: viewModel.loadingStatus == LoadingStatus.Initial ? viewModel.register : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(viewModel.loadingStatus == LoadingStatus.Initial ? "Register" : "Registering...")
                        ],
                      )
                  ),

                ],
              ),
            );
          },
          
          converter: (store) => RegisterViewModel.fromStore(store),
        )
      ),
    );
  }
}