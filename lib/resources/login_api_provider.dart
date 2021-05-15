import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/models/login_data.dart';
import 'package:test_project/utilities/ultils.dart';
import 'constants/constant.dart';

class LoginApiProvider {
  Future<String> getAccessToken() async {
    var url = Uri.https(baseUrl.toString(), "/token/GenerateToken/Post");
    final prefs = await SharedPreferences.getInstance();

    var response = await http.get(url, headers: {
      HttpHeaders.contentTypeHeader: contentnType,
      HttpHeaders.authorizationHeader: basicAuth,
    });

    if (response.statusCode == 200) {
      var now = DateTime.now();
      await prefs.setString('time_access', now.toString());
      String accessAuth = response.body.toString().replaceAll("\"", "");
      await prefs.setString("access_token", accessAuth);
      return accessAuth;
    } else {
      throw Exception(failedAccessMessage);
    }
  }

  Future<LoginData> postLogin(
      String usernameValue, String passwordValue) async {
    var bodyParams = {
      codeEmloyee: usernameValue,
      deviceIMEI: deviceIMEIValue,
      password: passwordValue,
      tokenNoti: tokenNotiValue,
      version: versionValue
    };
    final prefs = await SharedPreferences.getInstance();
    await checkAccessToken();
    String accessToken  = prefs.getString("access_token");
    var url = Uri.https(baseUrl, "/su2-wsmobinetautostag/MobiNet_Login/POST");

    var response = await http.post(url,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: contentnType,
          HttpHeaders.authorizationHeader: bearer + accessToken.toString(),
        },
        body: jsonEncode(bodyParams));
    print("login_token"+response.body);
    print("login_token"+accessToken.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> userMap = jsonDecode(response.body);
      return LoginData.fromJson(userMap);
    } else {
      throw Exception(failedLoginMessage);
    }
  }
}
