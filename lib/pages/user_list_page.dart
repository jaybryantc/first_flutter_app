import 'package:first_flutter_app/enums/loading_status.dart';
import 'package:first_flutter_app/pages/user_list_view_model.dart';
import 'package:first_flutter_app/redux/actions/api_actions.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:first_flutter_app/state/auth_state.dart';
import 'package:first_flutter_app/state/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:redux/redux.dart';

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
              padding: EdgeInsets.all(15),
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
            addRepaintBoundaries: true,
          );
        },

        converter: (store) => UserListViewModel.from(store),
      ),
      persistentFooterButtons: <Widget>[
        StoreConnector<AppState, UserListViewModel>(
          builder: (context, viewModel) {
            return RaisedButton(
              onPressed: viewModel.logOut,
              child: Text("Log out"),
              textColor: Colors.white,);
          },
          converter: (store) => UserListViewModel.from(store),
        ),
        
      ],
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
    padding: EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.network("http://www.clker.com/cliparts/3/f/d/e/13734162551503155025leaf.jpg", width: 50, height: 50,),
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_user.fullname, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),
              Text(_user.company),
              Text(_user.address),
            ],
          ),
        ),
      ],
    ),
  );
}
