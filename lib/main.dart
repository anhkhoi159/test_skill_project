import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
clickDemo(){
    print("OK clickkk");
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  bool _hidePW = true;
  void tapShow(){
    setState((){
      _hidePW=!_hidePW;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project Demo",
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  "Hello\nWelcome Back",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 20),
                child: TextField(
                  style: TextStyle(fontSize: 18,color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "USERNAME",
                      labelStyle: TextStyle(color: Colors.grey,fontSize: 15)),
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
                        style: TextStyle(fontSize: 18,color: Colors.black),
                        obscureText: _hidePW,
                        decoration: InputDecoration(
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(color: Colors.grey,fontSize: 15)),
                      ),
                    ),
                    GestureDetector(
                      onTap: tapShow,
                      child: Text(_hidePW?"SHOW":"HIDE",
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),
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
                  style:
                  ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)))
                  ),
                  child: Text("SIGN IN",style:
                  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("NEW USER? ",
                          style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        Text("SIGN UP",
                          style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text("FORGOT PASSWORD?",
                      style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

