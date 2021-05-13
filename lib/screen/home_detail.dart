import 'package:flutter/material.dart';


typedef void BooleanCallback();

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key key, this.gotoDetailDeployment}) : super(key: key);
  final BooleanCallback gotoDetailDeployment;

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  String coverImageUrl =
      "https://ueh.edu.vn/images/upload/thumbnail/ueh-thumbnail-030235-042021.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/cover_image.jpg'),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: widget.gotoDetailDeployment,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 50, 10, 5),
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border(
                                    top: BorderSide(color: Colors.white, width: 2),
                                    left: BorderSide(color: Colors.white, width: 2),
                                  )),
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        padding:EdgeInsets.only(bottom: 30),
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                      Text(
                                        "Triển khai",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "bảo trì",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: 5,left: 3),
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(2,5,2,5),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(7)),
                                      border: Border.all(width: 1.3, color: Colors.white),
                                  ),
                                  child: Text("5",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 50, 10, 5),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                border: Border(
                                  top: BorderSide(color: Colors.white, width: 2),
                                  left: BorderSide(color: Colors.white, width: 2),
                                )),
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding:EdgeInsets.only(bottom: 30),
                                      child: Icon(
                                        Icons.add_circle_outlined,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Tác vụ khác",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 5,left: 3),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(2,5,2,5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                  border: Border.all(width: 1.3, color: Colors.white),
                                ),
                                child: Text("5",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 5),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                              right: BorderSide(color: Colors.white, width: 2),
                            )),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                padding:EdgeInsets.only(bottom: 30),
                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  "Cập nhật",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Port.NET",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 5),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                            )),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding:EdgeInsets.only(bottom: 30),
                                  child: Icon(
                                    Icons.ad_units,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  "Quản lý",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "vật tư",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 5),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                            )),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding:EdgeInsets.only(bottom: 30),
                                  child: Icon(
                                    Icons.my_location,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  "Cập nhật",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "tọa độ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 50, 10, 5),
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: 2),
                              right: BorderSide(color: Colors.white, width: 2),
                            )),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  padding:EdgeInsets.only(bottom: 30),
                                  child: Icon(
                                    Icons.info,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Thông tin",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
