class DeploymentListData {
  List<DeploymentData> message;

  DeploymentListData({this.message});

  DeploymentListData.fromJson(Map<String, dynamic> json) {
    if (json['Message'] != null) {
      message = new List<DeploymentData>();
      json['Message'].forEach((v) {
        message.add(new DeploymentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['Message'] = this.message.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeploymentData {
  int key;
  String userAct;
  int iD;
  int supType;
  int objID;
  String contract;
  String fullName;
  String phone;
  String startDate;
  String address;
  String appointmentDate;
  String appointmentTime;
  String typeCustomer;
  String statusCustomer;
  String hDBox;
  String quantityBox;
  String typeContract;
  String checkInTime;
  String checkOutDate;
  int statusCall;
  int innitSatus;
  String innitDes;
  int isReceive;
  int isBefore;
  String isDesire;
  String requestName;
  String typeSupport;
  int amountAppointment;
  int completeTime;
  String completeDate;
  String amountAppointmentGreen;
  String amountAppointmentRed;
  int timeCheckOut;
  String loyalty;
  int exchangeType;

  DeploymentData(
      {this.key,
        this.userAct,
        this.iD,
        this.supType,
        this.objID,
        this.contract,
        this.fullName,
        this.phone,
        this.startDate,
        this.address,
        this.appointmentDate,
        this.appointmentTime,
        this.typeCustomer,
        this.statusCustomer,
        this.hDBox,
        this.quantityBox,
        this.typeContract,
        this.checkInTime,
        this.checkOutDate,
        this.statusCall,
        this.innitSatus,
        this.innitDes,
        this.isReceive,
        this.isBefore,
        this.isDesire,
        this.requestName,
        this.typeSupport,
        this.amountAppointment,
        this.completeTime,
        this.completeDate,
        this.amountAppointmentGreen,
        this.amountAppointmentRed,
        this.timeCheckOut,
        this.loyalty,
        this.exchangeType});

  DeploymentData.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    userAct = json['UserAct'];
    iD = json['ID'];
    supType = json['SupType'];
    objID = json['ObjID'];
    contract = json['Contract'];
    fullName = json['FullName'];
    phone = json['Phone'];
    startDate = json['Start_Date'];
    address = json['Address'];
    appointmentDate = json['AppointmentDate'];
    appointmentTime = json['AppointmentTime'];
    typeCustomer = json['TypeCustomer'];
    statusCustomer = json['StatusCustomer'];
    hDBox = json['HDBox'];
    quantityBox = json['QuantityBox'];
    typeContract = json['TypeContract'];
    checkInTime = json['CheckInTime'];
    checkOutDate = json['CheckOutDate'];
    statusCall = json['StatusCall'];
    innitSatus = json['InnitSatus'];
    innitDes = json['InnitDes'];
    isReceive = json['IsReceive'];
    isBefore = json['IsBefore'];
    isDesire = json['IsDesire'];
    requestName = json['RequestName'];
    typeSupport = json['TypeSupport'];
    amountAppointment = json['AmountAppointment'];
    completeTime = json['CompleteTime'];
    completeDate = json['CompleteDate'];
    amountAppointmentGreen = json['AmountAppointmentGreen'];
    amountAppointmentRed = json['AmountAppointmentRed'];
    timeCheckOut = json['TimeCheckOut'];
    loyalty = json['Loyalty'];
    exchangeType = json['ExchangeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    data['UserAct'] = this.userAct;
    data['ID'] = this.iD;
    data['SupType'] = this.supType;
    data['ObjID'] = this.objID;
    data['Contract'] = this.contract;
    data['FullName'] = this.fullName;
    data['Phone'] = this.phone;
    data['Start_Date'] = this.startDate;
    data['Address'] = this.address;
    data['AppointmentDate'] = this.appointmentDate;
    data['AppointmentTime'] = this.appointmentTime;
    data['TypeCustomer'] = this.typeCustomer;
    data['StatusCustomer'] = this.statusCustomer;
    data['HDBox'] = this.hDBox;
    data['QuantityBox'] = this.quantityBox;
    data['TypeContract'] = this.typeContract;
    data['CheckInTime'] = this.checkInTime;
    data['CheckOutDate'] = this.checkOutDate;
    data['StatusCall'] = this.statusCall;
    data['InnitSatus'] = this.innitSatus;
    data['InnitDes'] = this.innitDes;
    data['IsReceive'] = this.isReceive;
    data['IsBefore'] = this.isBefore;
    data['IsDesire'] = this.isDesire;
    data['RequestName'] = this.requestName;
    data['TypeSupport'] = this.typeSupport;
    data['AmountAppointment'] = this.amountAppointment;
    data['CompleteTime'] = this.completeTime;
    data['CompleteDate'] = this.completeDate;
    data['AmountAppointmentGreen'] = this.amountAppointmentGreen;
    data['AmountAppointmentRed'] = this.amountAppointmentRed;
    data['TimeCheckOut'] = this.timeCheckOut;
    data['Loyalty'] = this.loyalty;
    data['ExchangeType'] = this.exchangeType;
    return data;
  }
}