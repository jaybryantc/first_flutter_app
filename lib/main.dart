import 'package:first_flutter_app/pages/login_page.dart';
import 'package:first_flutter_app/pages/register_page.dart';
import 'package:first_flutter_app/pages/user_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => LoginPage(),
        LoginPage.ROUTE_NAME :(context) => LoginPage(),
        RegisterPage.ROUTE_NAME :(context) => RegisterPage(),
        UserListPage.ROUTE_NAME : (context) => UserListPage(),
      },
    );
  }
}