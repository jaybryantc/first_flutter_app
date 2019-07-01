import 'package:first_flutter_app/enums/register_field.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/state/register_state.dart';
import 'package:redux/redux.dart';

final register_reducer = combineReducers<RegisterState>([
  TypedReducer<RegisterState, CheckIfEmptyOrNull>(_checkIfEmptyOrNull),
  TypedReducer<RegisterState, MatchPassword>(_matchPassword),
  TypedReducer<RegisterState, UpdateErrors>(_updateErrors),
  TypedReducer<RegisterState, Register>(_register),
  TypedReducer<RegisterState, SetLoadingStatus>(_setLoadingStatus),
  TypedReducer<RegisterState, UpdateBirthDate>(_updateBirthDate),
  TypedReducer<RegisterState, ResetRegister>(_resetRegister),
  TypedReducer<RegisterState, SuccessfulRegistration>(_successful),
  TypedReducer<RegisterState, UnsuccessfulRegistration>(_unsuccessful),
]);

RegisterState _checkIfEmptyOrNull(RegisterState state, action) => state.rebuild((state) {
  switch(action.field.field) {
    case RegisterField.USERNAME:
      state
        ..username = action.content;
      break;
    case RegisterField.PASSWORD:
      state
        ..password = action.content;
      break;
    case RegisterField.RETYPE_PASSWORD:
      state
        ..retypePassword = action.content;
      break;
    case RegisterField.FULLNAME:
      state
        ..fullname = action.content;
      break;
    case RegisterField.COMPANY:
      state
        ..company = action.content;
      break;
    case RegisterField.ADDRESS:
      state
        ..address = action.content;
      break;
  }
});

RegisterState _matchPassword(RegisterState state, action) => state.rebuild((state){
  state
    ..password = action.password
      ..retypePassword = action.retypePassword;
});

RegisterState _updateErrors(RegisterState state, action) => state.rebuild((state) {
  switch(action.field) {
    case RegisterField.USERNAME:
      state
        ..usernameError = action.error;
      break;
    case RegisterField.PASSWORD:
      state
        ..passwordError = action.error;
      break;
    case RegisterField.RETYPE_PASSWORD:
      state
        ..retypePasswordError = action.error;
      break;
    case RegisterField.FULLNAME:
      state
        ..fullnameError = action.error;
      break;
    case RegisterField.COMPANY:
      state
        ..companyError = action.error;
      break;
    case RegisterField.ADDRESS:
      state
        ..addressError = action.error;
      break;
    case RegisterField.BIRTHDATE:
      state
        ..birthdateError = action.error;
      break;
  }
});

RegisterState _register(RegisterState state, action) => state;

RegisterState _setLoadingStatus(RegisterState state, action) => state.rebuild((state) {
  state
    ..loadingStatus = action.status;
});

RegisterState _updateBirthDate(RegisterState state, action) => state.rebuild((state) {
  state
    ..birthDate = action.birthDate
    ..birthdateError = null;
});

RegisterState _resetRegister(RegisterState state, action) => RegisterState();

RegisterState _successful(RegisterState state, action) => state;

RegisterState _unsuccessful(RegisterState state, action) => state;
