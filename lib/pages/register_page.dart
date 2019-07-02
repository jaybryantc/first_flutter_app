import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/enums/register_field.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

class RegisterPage extends StatelessWidget {
  static final String ROUTE_NAME = "/register";
  final double padding = 20;

  void _selectBirthdate(BuildContext context, RegisterViewModel viewModel) async {
    DateTime selectedDate = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      viewModel.updateBirthDate(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Register"),
    ),
    body: Scrollbar(
        child: StoreConnector<AppState, RegisterViewModel>(
          onInit: (store) {
            store.dispatch(ResetRegister());
          },
          builder: (context, viewModel) => Scrollable(
              viewportBuilder: (context, viewportOffset) => Container(
                padding: EdgeInsets.all(padding),
                child: Column(
                  children: [
                    TextField(
                      enabled: viewModel.registerButtonEnabled,
                      decoration: InputDecoration(
                        hintText: "Type your username here",
                        labelText: "Username",
                        errorText: viewModel.registerState.usernameError,
                      ),
                      maxLines: 1,
                      onChanged: (text) {
                        print('Username $text');
                        viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.USERNAME, "username"));
                      },
                    ),
                    TextField(
                      enabled: viewModel.registerButtonEnabled,
                      decoration: InputDecoration(
                        hintText: "Type your password here",
                        labelText: "Password",
                        errorText: viewModel.registerState.passwordError,
                      ),
                      maxLines: 1,
                      onChanged: (text) {
                        print('Password $text');
                        viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.PASSWORD, "password"));
                      },
                      obscureText: true,
                    ),
                    TextField(
                      enabled: viewModel.registerButtonEnabled,
                      decoration: InputDecoration(
                        hintText: "Retype your password",
                        labelText: "Verify your password",
                        errorText: viewModel.registerState.retypePasswordError,
                      ),
                      maxLines: 1,
                      onChanged: (text) {
                        print('Password 2 $text');
                        if (text.isEmpty) {
                          viewModel.checkIfNotEmpty(text, RegisterFieldType(
                              RegisterField.RETYPE_PASSWORD,
                              "password validation"));
                        } else {
                          viewModel.matchPassword(viewModel.registerState.password, text);
                        }
                      },
                      obscureText: true,
                    ),
                    TextField(
                      enabled: viewModel.registerButtonEnabled,
                      decoration: InputDecoration(
                        hintText: "Type your full name here",
                        labelText: "Full Name",
                        errorText: viewModel.registerState.fullnameError,
                      ),
                      maxLines: 1,
                      onChanged: (text) {
                        print('Full Name $text');
                        viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.FULLNAME, "full name"));
                      },
                    ),
                    TextField(
                      enabled: viewModel.registerButtonEnabled,
                      decoration: InputDecoration(
                        hintText: "Type your company name here",
                        labelText: "Company",
                        errorText: viewModel.registerState.companyError,
                      ),
                      maxLines: 1,
                      onChanged: (text) {
                        print('Company $text');
                        viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.COMPANY, "company"));
                      },
                    ),
                    TextField(
                      enabled: viewModel.registerButtonEnabled,
                      decoration: InputDecoration(
                        hintText: "Type your address here",
                        labelText: "Address",
                        errorText: viewModel.registerState.addressError,
                      ),
                      minLines: 1,
                      maxLines: 3,
                      onChanged: (text) {
                        print('Company $text');
                        viewModel.checkIfNotEmpty(text, RegisterFieldType(RegisterField.ADDRESS, "address"));
                      },
                    ),
                    FlatButton(
                        onPressed: viewModel.registerButtonEnabled ? () => _selectBirthdate(context, viewModel) : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(viewModel.birthdate)
                          ],
                        )
                    ),
                    Text(viewModel.birthdateError, style: TextStyle(color: Colors.red, ),),
                    RaisedButton(
                        onPressed: viewModel.register,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(viewModel.registerButtonLabel)
                          ],
                        )
                    ),
                  ],
                ),
              )
          ),
          converter: (store) => RegisterViewModel.fromStore(store),
        )
    ),
  );
}

class RegisterViewModel {
  RegisterState registerState;
  String birthdate;
  String birthdateError;
  Function(String content, RegisterFieldType field) checkIfNotEmpty;
  Function(String password, String retypePassword) matchPassword;
  Function(DateTime birthdate) updateBirthDate;
  Function register;
  String registerButtonLabel;
  bool registerButtonEnabled;

  RegisterViewModel({
    this.registerState,
    this.birthdate,
    this.birthdateError,
    this.checkIfNotEmpty,
    this.matchPassword,
    this.register,
    this.updateBirthDate,
    this.registerButtonLabel,
    this.registerButtonEnabled,
  });

  static RegisterViewModel fromStore(Store<AppState> store) {
    return RegisterViewModel(
      registerState: store.state.registerState,
      birthdate: store.state.registerState.birthDate != null ? 'Birth Date : ${DateFormat('MMM-dd-yyyy').format(store.state.registerState.birthDate)}' : "Click to select your Birth Date",
      birthdateError: store.state.registerState.birthdateError ?? "",
      checkIfNotEmpty: (content, field) => store.dispatch(CheckIfEmptyOrNull(content, field)),
      matchPassword: (password, retypePassword) => store.dispatch(MatchPassword(password, retypePassword)),
      updateBirthDate: (birthdate) => store.dispatch(UpdateBirthDate(birthdate)),
      register: store.state.registerState.loadingStatus == LoadingStatus.Initial ? () => store.dispatch(Register(store.state.registerState.username,
          store.state.registerState.password,
          store.state.registerState.retypePassword,
          store.state.registerState.fullname,
          store.state.registerState.company,
          store.state.registerState.address,
          store.state.registerState.birthDate)) : null,
      registerButtonLabel: store.state.registerState.loadingStatus == LoadingStatus.Initial ? "Register" : "Registering...",
      registerButtonEnabled: store.state.registerState.loadingStatus == LoadingStatus.Initial,
    );
  }
}