import 'dart:convert';
import 'dart:io';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:test_project/models/login_data.dart';
import 'package:test_project/models/login_params.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hidePW = true;
  void tapShow() {
    setState(() {
      _hidePW = !_hidePW;
    });
  }

  ScrollController _scrollController = new ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: FlutterLogo(),
              height: 70,
              width: 70,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hello\nWelcome Back",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: _hidePW,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                  ),
                  GestureDetector(
                    onTap: tapShow,
                    child: Text(
                      _hidePW ? "SHOW" : "HIDE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: clickDemo,
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "NEW USER? ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text("FORGOT PASSWORD?",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

clickDemo() {
  print("OK clickkk");
  final startTime = DateTime(2018, 6, 23, 12, 58);
  final endTime = DateTime(2018, 6, 23, 13, 00);
  print("ssss time "+endTime.difference(startTime).inHours.toString());

  // getAccessToken();
}

Future<String> getAccessToken() async {
  var url = Uri.https("sapi.fpt.vn", "/token/GenerateToken/Post");

  var response = await http.get(url, headers: {
    HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8",
    HttpHeaders.authorizationHeader:
        "Basic dGhpZW50cTNfbmV3QGZwdC5jb20udm46MTIzNDU2"
  });
  String basicAuth = response.body.toString().replaceAll("\"", "");
  postLoginToken(basicAuth);
  return "";
}

Future<LoginData> postLoginToken(String basicAuth) async {
  var params = {
    "CodeEmloyee": "00177292",
    "DeviceIMEI": "357625085532441",
    "Password": "432403",
    "TokenNoti":
        "dIom-MNHSI-tjpV4048Itp:APA91bHVwh2qGaCHo5eZSoVPALhw9oak2qb-uL_T-Bmisb03EK1DM5bHIAO7LZoRuOWuhI9Egt6oBsilVpWoZFYEQ2XZ_sIY669y00nVYG7CuBjx6NO1i4P7_do-aposPX8sxIxghajW",
    "Version": "6.10.0"
  };
  var url =
      Uri.https("sapi.fpt.vn", "/su2-wsmobinetautostag/MobiNet_Login/POST");

  var responsePost = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + basicAuth,
      },
      body: jsonEncode(params));
  if (responsePost.statusCode == 200) {
    Map<String, dynamic> userMap = jsonDecode(responsePost.body);
    var loginData = LoginData.fromJson(userMap);
    print("dataaa22222 " + responsePost.statusCode.toString());
    print("dataaa22222 " + responsePost.body);
    print("dataaa22222 " + loginData.message.accessToken.toString());
    print("dataaa22222 " + loginData.message.result.userName.toString());
  }


  return null;
}

Future<http.Response> postDataDetail(
    String basicAuth, String baererAuth, String FuntiongetData) async {
  var params = {"Type": 0, "UserName": FuntiongetData};

  var url = Uri.https(
      "sapi.fpt.vn", "su2-wsmobinetautostag/MobiNet_GetListDepMain/POST");

  var responsePost = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + basicAuth,
        'AuthorizationX': 'bearer ' + baererAuth,
      },
      body: jsonEncode(params));
}
