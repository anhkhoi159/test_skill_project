import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/BloC/home_bloc.dart';
import 'package:test_project/models/deployment_data.dart';
import 'package:test_project/screen/deployment_item.dart';

typedef void BooleanCallback();

class DeploymentListDetail extends StatefulWidget {
  const DeploymentListDetail({Key key, this.gotoHomeDetail}) : super(key: key);
  final BooleanCallback gotoHomeDetail;

  @override
  _DeploymentListDetailState createState() => _DeploymentListDetailState();
}

class _DeploymentListDetailState extends State<DeploymentListDetail> {
  DeploymentListData listData;

  @override
  void initState() {
    super.initState();
    homeBloc
        .getDeploymentData()
        .then((value) => {setState(() => listData = value)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          listData != null
              ? Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                        height: double.maxFinite,
                        padding: EdgeInsets.only(bottom: 50),
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: listData.message.length,
                              itemBuilder: (context, index) {
                                return DeploymentItem(
                                  data: listData.message[index],
                                  index: index.toString(),
                                );
                              }),
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                            onPressed: widget.gotoHomeDetail,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[850],
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            child: Text(
                              "ĐÓNG",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )))
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }
}

