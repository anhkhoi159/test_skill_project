class LoginData {
  Message message;

  LoginData({this.message});

  LoginData.fromJson(Map<String, dynamic> json) {
    message =
    json['Message'] != null ? new Message.fromJson(json['Message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['Message'] = this.message.toJson();
    }
    return data;
  }
}

class Message {
  int errorCode;
  String message;
  String tokenType;
  String accessToken;
  int expiresIn;
  Result result;

  Message(
      {this.errorCode,
        this.message,
        this.tokenType,
        this.accessToken,
        this.expiresIn,
        this.result});

  Message.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    message = json['Message'];
    tokenType = json['Token_Type'];
    accessToken = json['Access_Token'];
    expiresIn = json['Expires_In'];
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this.errorCode;
    data['Message'] = this.message;
    data['Token_Type'] = this.tokenType;
    data['Access_Token'] = this.accessToken;
    data['Expires_In'] = this.expiresIn;
    if (this.result != null) {
      data['Result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String userName;
  String description;
  String isActive;
  String isLogin;
  int localtionID;
  int deptID;
  int partnerID;
  String supporter;
  int blockID;
  bool isValid;
  String accountPay;
  int staffID;

  Result(
      {this.userName,
        this.description,
        this.isActive,
        this.isLogin,
        this.localtionID,
        this.deptID,
        this.partnerID,
        this.supporter,
        this.blockID,
        this.isValid,
        this.accountPay,
        this.staffID});

  Result.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    description = json['Description'];
    isActive = json['IsActive'];
    isLogin = json['IsLogin'];
    localtionID = json['LocaltionID'];
    deptID = json['DeptID'];
    partnerID = json['PartnerID'];
    supporter = json['Supporter'];
    blockID = json['BlockID'];
    isValid = json['IsValid'];
    accountPay = json['AccountPay'];
    staffID = json['StaffID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Description'] = this.description;
    data['IsActive'] = this.isActive;
    data['IsLogin'] = this.isLogin;
    data['LocaltionID'] = this.localtionID;
    data['DeptID'] = this.deptID;
    data['PartnerID'] = this.partnerID;
    data['Supporter'] = this.supporter;
    data['BlockID'] = this.blockID;
    data['IsValid'] = this.isValid;
    data['AccountPay'] = this.accountPay;
    data['StaffID'] = this.staffID;
    return data;
  }
}
