import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/redux/actions/auth_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class UserListPage extends StatelessWidget {
  static final String ROUTE_NAME = "users";

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, UserListViewModel>(
    onInit: (store) {
      store.dispatch(GetUserList());
    },
    builder: (context, viewModel) => Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: viewModel.showList ?  _ListWidget(viewModel) : _InitialWidget(viewModel),
      persistentFooterButtons: [
        RaisedButton(
          onPressed: viewModel.logOut,
          child: Text("Log out"),
          textColor: Colors.white,),
      ],
    ),
    converter: (store) => UserListViewModel.from(store),
  );
}

class _InitialWidget extends StatelessWidget {
  final double padding = 15;
  UserListViewModel viewModel;
  _InitialWidget(this.viewModel);
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(padding),
    child: Center(
        child: Text(viewModel.initialText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        )
    ),
  );
}

class _ListWidget extends StatelessWidget {
  final UserListViewModel viewModel;
  _ListWidget(this.viewModel);
  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: viewModel.users.length,
    itemBuilder: (context, index) => _UserItemTile(viewModel.users[index]),
    addRepaintBoundaries: true,
  );
}

class _UserItemTile extends StatelessWidget {
  final User user;
  _UserItemTile(this.user);
  @override
  Widget build(BuildContext context) => user != null ? _UserItem(user) : _UserNotFoundItem();
}

class _UserNotFoundItem extends StatelessWidget {
  final double padding = 10;
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(padding),
    child: Text("User not found."),
  );
}

class _UserItem extends StatelessWidget {
  final double padding = 15;
  _UserItem(this.user);
  final User user;
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(padding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network("http://www.clker.com/cliparts/3/f/d/e/13734162551503155025leaf.jpg", width: 50, height: 50,),
        Container(
          padding: EdgeInsets.only(left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.fullname, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),
              Text(user.company),
              Text(user.address),
            ],
          ),
        ),
      ],
    ),
  );
}

class UserListViewModel {
  String initialText;
  bool showList;
  List<User> users;
  LoadingStatus loadingStatus;
  Function getUsers;
  Function logOut;

  UserListViewModel({
    this.initialText,
    this.showList,
    this.users,
    this.loadingStatus,
    this.getUsers,
    this.logOut
  });

  static UserListViewModel from(Store<AppState> store) {
    return UserListViewModel(
        initialText: store.state.usersState.loadingStatus == LoadingStatus.Loading ? "Loading..." : "Users not loaded",
        showList: store.state.usersState.users != null,
        users: store.state.usersState.users,
        loadingStatus: store.state.usersState.loadingStatus,
        getUsers: () => store.dispatch(GetUserList()),
        logOut: () => store.dispatch(LogOut())
    );
  }
}