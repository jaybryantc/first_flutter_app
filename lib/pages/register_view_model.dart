import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/register_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:redux/redux.dart';


// TODO: view model should be inside the register_page
// TODO: data here should be in a class instead
class RegisterViewModel {
  String username;
  String password;
  String retypePassword;
  String fullname;
  String company;
  String address;
  DateTime birthDate;
  String usernameError;
  String passwordError;
  String retypePasswordError;
  String fullnameError;
  String companyError;
  String addressError;
  String birthdateError;

  Function(String content, RegisterFieldType field) checkIfNotEmpty;
  Function(String password, String retypePassword) matchPassword;
  Function(DateTime birthdate) updateBirthDate;
  Function register;

  LoadingStatus loadingStatus;
  
  RegisterViewModel({
    this.username,
    this.password,
    this.retypePassword,
    this.fullname,
    this.company,
    this.address,
    this.birthDate,
    this.usernameError,
    this.passwordError,
    this.retypePasswordError,
    this.fullnameError,
    this.companyError,
    this.addressError,
    this.birthdateError,
    this.checkIfNotEmpty,
    this.matchPassword,
    this.register,
    this.updateBirthDate,
    this.loadingStatus
  });

  static RegisterViewModel fromStore(Store<AppState> store) {
    return RegisterViewModel(
      username: store.state.registerState.username,
      password: store.state.registerState.password,
      retypePassword: store.state.registerState.retypePassword,
      fullname: store.state.registerState.company,
      address: store.state.registerState.address,
      birthDate: store.state.registerState.birthDate,
      usernameError: store.state.registerState.usernameError,
      passwordError: store.state.registerState.passwordError,
      retypePasswordError: store.state.registerState.retypePasswordError,
      fullnameError: store.state.registerState.fullnameError,
      companyError: store.state.registerState.companyError,
      addressError: store.state.registerState.addressError,
      birthdateError: store.state.registerState.birthdateError,
      checkIfNotEmpty: (content, field) => store.dispatch(CheckIfEmptyOrNull(content, field)),
      matchPassword: (password, retypePassword) => store.dispatch(MatchPassword(password, retypePassword)),
      updateBirthDate: (birthdate) => store.dispatch(UpdateBirthDate(birthdate)),
      register: () => store.dispatch(Register(store.state.registerState.username,
          store.state.registerState.password,
          store.state.registerState.retypePassword,
          store.state.registerState.fullname,
          store.state.registerState.company,
          store.state.registerState.address,
          store.state.registerState.birthDate)),
      loadingStatus: store.state.registerState.loadingStatus,
    );
  }

}
