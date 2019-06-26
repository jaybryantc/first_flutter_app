import 'package:built_collection/built_collection.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';

class UpdateCurrentUser {
  User user;
  UpdateCurrentUser(this.user);

  AppState appReduce(AppState state, action) => state.rebuild((state) {
    state ..currentUser.replace(user);
  });

}

class UpdateUserList {
  BuiltList<User> users;
  UpdateUserList(this.users);

  AppState appReduce(AppState state, action) => state.rebuild((state) {
    state ..userList.replace(this.users);
  });

}
