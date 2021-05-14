import 'package:background_location/background_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_project/models/deployment_data.dart';

class DeploymentItem extends StatefulWidget {
  const DeploymentItem({Key key, this.data, this.index}) : super(key: key);
  final DeploymentData data;
  final String index;

  @override
  _DeploymentItemState createState() => _DeploymentItemState();
}

class _DeploymentItemState extends State<DeploymentItem> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  height: 35,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(width: 1.3, color: Colors.cyan)),
                  child: Text(
                    widget.data.supType == 1 ? "Triển khai" : "Bảo trì",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: Border.all(width: 1.3, color: Colors.cyan),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(widget.data.isReceive==0?Icons.check_box_outline_blank:Icons.check_box_outlined,
                                color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.phone, color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(Icons.vpn_key_sharp,
                                  color: Colors.amber),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                  widget.data.userAct != ""
                                      ? Icons.account_box
                                      : Icons.group,
                                  color: Colors.grey),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child:
                                  Icon(Icons.add_box_sharp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      BlackItem(
                        title: "STT:",
                        value: widget.index,
                      ),
                      BlueItem(title: "Hợp đồng:", value: widget.data.contract),
                      BlackItem(
                        title: "Tên KH: ",
                        value: widget.data.fullName,
                      ),
                      BlackItem(
                        title: "Ngày tạo:",
                        value: widget.data.startDate,
                      ),
                      BlackItem(
                        title: "Địa chỉ:",
                        value: widget.data.address,
                      ),
                      BlueItem(
                        title: "Ngày KH hẹn",
                        value: widget.data.appointmentDate,
                        isBoldValue: true,
                        isCountAppointment: true,
                        countAppointment: widget.data.amountAppointment,
                      ),
                      BlueItem(title: "Múi giờ", value: widget.data.amountAppointmentGreen),
                      BlackItem(
                        title: "Loại KH:",
                        value: widget.data.typeCustomer,
                      ),
                      BlackItem(
                        title: "Tình trạng:",
                        value: widget.data.statusCustomer,
                      ),
                      BlackItem(
                        title: "HDBox:",
                        value: widget.data.hDBox,
                        isQualitiBox: true,
                        qualitiBox: widget.data.quantityBox,
                      ),
                      BlackItem(
                        title: "Loại HD:",
                        value: widget.data.typeContract,
                      ),
                      BlackItem(
                        title: "Lịch sử giao dịch:",
                        value: "",
                        isUnderLineTitle: true,
                        isItalicTitle: true,
                      ),
                      BlackItem(
                        title: "Tracking:",
                        value: "",
                        isItalicTitle: true,
                        isUnderLineTitle: true,
                      ),
                      BlackItem(
                        title: "Checkin dự kiến:",
                        value: widget.data.checkInTime,
                        isItalicTitle: true,
                        isBoldValue: true,
                        isItalicValue: true,
                        widthTitle: 150,
                      ),
                      BlackItem(
                        title: "TG hoàn tất đúng hẹn:",
                        value: widget.data.completeDate,
                        isItalicValue: true,
                        isBoldValue: true,
                        valueColor: Colors.red,
                        widthTitle: 150,
                      ),
                      BlackItem(
                        title: "Nguồn tạo:",
                        value: widget.data.requestName,
                      ),
                      BlackItem(
                        title: "Loại phiếu:",
                        value: widget.data.typeSupport,
                      ),

                      //2Button in the bottom
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.cyanAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: ElevatedButton(
                                    onPressed: checkIn,
                                    child: Text(
                                      "CHECK IN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 2),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Colors.cyanAccent,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.only(left: 2),
                                  child: ElevatedButton(
                                    onPressed: tickHen,
                                    child: Text(
                                      "TÍCH HẸN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.build_circle_rounded,
                          size: 40,
                          color: widget.data.statusCall == 0
                              ? Colors.lightGreenAccent[700]
                              : (widget.data.statusCall == 1
                                  ? Colors.orange
                                  : (widget.data.statusCall == 2
                                      ? Colors.red
                                      : null)),
                        ),
                        Icon(Icons.run_circle_rounded, size: 40,color: Colors.lightGreenAccent[700],)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void checkIn(){
    print("Checkin button");
    BackgroundLocation.getLocationUpdates((location) {
      String locationStr = "Latitude: "+location.latitude.toString()+"\nLongitude: "+location.longitude.toString();
      Fluttertoast.showToast(
          msg: locationStr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[400],
          textColor: Colors.black,
          fontSize: 16.0
      );

    });

  }
  void tickHen(){
    print("tickHen button");

  }
}

//row with black color
class BlackItem extends StatelessWidget {
  const BlackItem({
    Key key,
    @required this.title,
    @required this.value,
    this.isItalicTitle = false,
    this.isUnderLineTitle = false,
    this.isBoldValue = false,
    this.valueColor = Colors.black,
    this.isQualitiBox = false,
    this.qualitiBox,
    this.isItalicValue = false,
    this.widthTitle = 100,
  }) : super(key: key);
  final String title;
  final String value;
  final bool isItalicTitle;
  final bool isUnderLineTitle;
  final bool isBoldValue;
  final bool isItalicValue;
  final Color valueColor;
  final bool isQualitiBox;
  final String qualitiBox;
  final double widthTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: widthTitle,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 13,
                    fontStyle: isItalicTitle ? FontStyle.italic : null,
                    decoration:
                        isUnderLineTitle ? TextDecoration.underline : null),
              )),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 15,
                fontWeight: isBoldValue ? FontWeight.bold : null,
                fontStyle: isItalicValue ? FontStyle.italic : null,
              ),
            ),
          ),
          isQualitiBox
              ? Container(
                  width: 100,
                  child: Text("SL: " + qualitiBox,
                      style: TextStyle(fontSize: 15, color: valueColor)),
                )
              : Container()
        ],
      ),
    );
  }
}

//row with blue color
class BlueItem extends StatelessWidget {
  const BlueItem(
      {Key key,
      @required this.title,
      @required this.value,
      this.isBoldValue = false,
      this.isCountAppointment = false,
      this.countAppointment})
      : super(key: key);
  final String title;
  final String value;
  final isBoldValue;
  final bool isCountAppointment;
  final int countAppointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 100,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                    fontSize: 13),
              )),
          Expanded(
              flex: 1,
              child: Text(
                value,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 15,
                    fontWeight: isBoldValue ? FontWeight.bold : null),
              )),
          isCountAppointment
              ? Container(
                  child: Text("SL hẹn: " + countAppointment.toString(),
                      style: TextStyle(fontSize: 15, color: Colors.blue[900])),
                )
              : Container()
        ],
      ),
    );
  }
}

//demo data
