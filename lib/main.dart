import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/screen/home_page.dart';
import 'package:test_project/utilities/ultils.dart';
import 'BloC/login_bloc.dart';
import 'screen/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool checkLogin;
  bool isCheck = false;

  @override
  void initState() {
    super.initState();
    BackgroundLocation.startLocationService();
    checkIsLogin().then((isLogin) async => {
          if (isLogin)
            {
              setState(() {
                isCheck = true;
                checkLogin = true;
              })
            }
          else
            {
              setState(() {
                isCheck = true;
                checkLogin = false;
              })
            }
        });
  }

  @override
  void dispose() {
    super.dispose();
    BackgroundLocation.stopLocationService();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: isCheck
              ? (checkLogin ? HomePage() : LoginPage())
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
