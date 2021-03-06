import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

import 'package:test_project/BloC/login_bloc.dart';
import 'package:test_project/screen/home_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
  }


  bool _hidePW = true;

  void tapShow() {
    setState(() {
      _hidePW = !_hidePW;
    });
  }

  @override
  Widget build(BuildContext context) {

    final userController = TextEditingController(text: "00177292");
    final passController = TextEditingController(text: "432403");

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
                controller: userController,
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
                      controller: passController,
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
                onPressed: ()=>{clickLogin(userController.text, passController.text)},
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

  clickLogin(String user,String pass) {
    print("OK clickkk Login");
    loginBloc.login(user, pass).then((value) => {
      if(value){
        onNavigateHome()
      }else{
        Fluttertoast.showToast(
        msg: "Failed to Login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[400],
        textColor: Colors.black,
        fontSize: 16.0
       )
      }
    });

  }

  void onNavigateHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}

//data for repo


