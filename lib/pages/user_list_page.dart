import 'package:first_flutter_app/state/user.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  static final String ROUTE_NAME = "users";
  @override
  State<StatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => UserItemTile(null),
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