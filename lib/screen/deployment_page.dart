import 'package:flutter/material.dart';
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
  var listData = getData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            height: double.maxFinite,
            padding: EdgeInsets.only(bottom: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DeploymentItem(data: listData[0],index: 1.toString(),),
                  DeploymentItem(data: listData[1],index: 1.toString(),),
                ],
              )
            ),
          ),
          SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                  onPressed: widget.gotoHomeDetail,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[850],
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Text(
                    "ĐÓNG",style: TextStyle(color: Colors.white,fontSize: 15),
                  )))
        ],
      ),
    );
  }



}

List<DeploymentData> getData() {
  var response = {
    "Message": [
      {
        "Key": "1",
        "UserAct": "",
        "ID": "1078280316",
        "SupType": 1,
        "ObjID": 1052410983,
        "Contract": "SGH798554",
        "FullName": "NGUYỄN THỊ TUYẾT",
        "Phone": "0906200687",
        "Start_Date": "3/4/2020 11:06:07 AM",
        "Address": "12,Hòa Hưng,P.13,Quận 10HCM",
        "AppointmentDate": "23/03/2020 15:30:00",
        "AppointmentTime": "13:30 - 15:30",
        "TypeCustomer": "Cá nhân Việt Nam",
        "StatusCustomer": "Khách hàng loại 3",
        "HDBox": "",
        "QuantityBox": "",
        "TypeContract": "FTTH - Super22",
        "CheckInTime": "25/03/2020 08:55:24 AM",
        "CheckOutDate": "25/03/2020 10:45:24 AM",
        "StatusCall": 0,
        "InnitSatus": 0,
        "InnitDes": "",
        "IsReceive": 1,
        "IsBefore": 0,
        "IsDesire": "1",
        "RequestName": "IBB",
        "TypeSupport": "Triển khai mới",
        "AmountAppointment": 4,
        "CompleteTime": 0,
        "CompleteDate": "N/A",
        "AmountAppointmentGreen":
        "23/03/2020 15:30:00 | 13:30 - 15:30 | 0 | IBB",
        "AmountAppointmentRed": "N/A |  | 0 | ",
        "TimeCheckOut": 15,
        "Loyalty": ""
      },
      {
        "Key": "2",
        "UserAct": "",
        "ID": "1078280316",
        "SupType": 2,
        "ObjID": 1052410983,
        "Contract": "SGH798554",
        "FullName": "NGUYỄN THỊ TUYẾT",
        "Phone": "0906200687",
        "Start_Date": "3/4/2020 11:06:07 AM",
        "Address": "12,Hòa Hưng,P.13,Quận 10HCM",
        "AppointmentDate": "23/03/2020 15:30:00",
        "AppointmentTime": "13:30 - 15:30",
        "TypeCustomer": "Cá nhân Việt Nam",
        "StatusCustomer": "Khách hàng loại 3",
        "HDBox": "",
        "QuantityBox": "",
        "TypeContract": "FTTH - Super22",
        "CheckInTime": "25/03/2020 08:55:24 AM",
        "CheckOutDate": "25/03/2020 10:45:24 AM",
        "StatusCall": 0,
        "InnitSatus": 0,
        "InnitDes": "",
        "IsReceive": 0,
        "IsBefore": 0,
        "IsDesire": "1",
        "RequestName": "IBB",
        "TypeSupport": "Triển khai mới",
        "AmountAppointment": 4,
        "CompleteTime": 0,
        "CompleteDate": "N/A",
        "AmountAppointmentGreen":
        "23/03/2020 15:30:00 | 13:30 - 15:30 | 0 | IBB",
        "AmountAppointmentRed": "N/A |  | 0 | ",
        "TimeCheckOut": 15,
        "Loyalty": ""
      }
    ]
  };
  var data = DeploymentListData.fromJson(response);
  return data.message;
}