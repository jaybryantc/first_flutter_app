import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/pages/user_list_view_model.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class UserListPage extends StatefulWidget {
  static final String ROUTE_NAME = "users";
  @override
  State<StatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: StoreConnector<AppState, UserListViewModel>(
        onInit: (store) {
          store.dispatch(GetUserList());
        },

        builder: (context, viewModel) {

          if (viewModel.users == null) {
            String text = viewModel.loadingStatus == LoadingStatus.Loading ? "Loading..." : "Users not loaded";
            return Container(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                )
              ),
            );
          }

          return ListView.builder(
            itemCount: viewModel.users.length,
            itemBuilder: (context, index) => UserItemTile(viewModel.users[index]),
          );
        },

        converter: (store) => UserListViewModel.from(store),
      ),
    );
  }
}

class UserItemTile extends StatelessWidget {

  UserItemTile(this._user);
  final User _user;

  @override
  Widget build(BuildContext context) => _user != null ? UserItem(_user) : UserNotFoundItem();
}

class UserNotFoundItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(10),
    child: Text("User not found."),
  );
}

class UserItem extends StatelessWidget {

  UserItem(this._user);
  final User _user;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(_user.fullname),
        Text(_user.company),
      ],
    ),
  );

}