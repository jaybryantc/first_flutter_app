import 'package:first_flutter_app/enums/LoadingStatus.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:redux/redux.dart';

class UserListViewModel {
  List<User> users;
  LoadingStatus loadingStatus;
  Function getUsers;

  UserListViewModel({this.users, this.loadingStatus, this.getUsers});


  static UserListViewModel from(Store<AppState> store) {
    return UserListViewModel(
      users: store.state.usersState.users,
      loadingStatus: store.state.usersState.loadingStatus,
      getUsers: () => store.dispatch(GetUserList()),
    );
  }
}