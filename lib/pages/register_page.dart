import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static final String ROUTE_NAME = "/register";
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
    );
  }

}