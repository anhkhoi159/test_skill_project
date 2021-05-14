import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/models/login_data.dart';
import 'package:test_project/resources/login_repository.dart';

class LoginBloC {

  final loginRepository = LoginRepository();
  final _accessTokenController = StreamController();
  final _loginController = StreamController();

  Stream<String> get accessTokenController => _loginController.stream;

  Stream<LoginData> get loginController => _accessTokenController.stream;

  getAccesstoken() async {
    var response = await loginRepository.fetchAccessToken();
    print("get Access Token in BloC: "+response);

  }

  Future<bool> login(String username, String password) async {
    var response = await loginRepository.login(username, password);
    if (response.message.errorCode!=0){
      return false;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", response.message.result.userName);
    prefs.setBool("is_login", true);
    print("get Access Token in BloC: "+response.message.errorCode.toString());

    return true;

    // _loginController.sink.add(response);
  }
  dispose() {
    _accessTokenController.close();
    _loginController.close();
  }
}
final loginBloc = LoginBloC();
