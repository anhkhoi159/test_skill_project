import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:test_project/screen/home_page.dart';
import 'package:test_project/utilities/ultils.dart';
import 'screen/login_page.dart';

void main() {
  BackgroundLocation.startLocationService();
  checkIsLogin().then((isLogin) => {
    if(isLogin){

    }else{
      checkAccessToken()
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: LoginPage(),
        ),
      ),
    );
  }
}
