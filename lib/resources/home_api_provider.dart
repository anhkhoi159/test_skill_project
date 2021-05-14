import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/models/deployment_data.dart';
import 'package:http/http.dart' as http;
import 'constants/constant.dart';

class HomeApiProvider {
  Future<DeploymentListData> getDeploymentList() async {
    final prefs = await SharedPreferences.getInstance();
    String loginToken = prefs.getString("login_token");
    String funtiongetData = prefs.getString("name");
    String accessToken = prefs.getString("access_token");
    var params = {"Type": 0, username: funtiongetData};
    
    var url =
        Uri.https(baseUrl, "su2-wsmobinetautostag/MobiNet_GetListDepMain/POST");
    print("detail 1"+loginToken);
    print("detail 2"+accessToken);
    var response = await http.post(url,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: contentnType,
          HttpHeaders.authorizationHeader: bearer + accessToken.toString(),
          authorizationX: bearer+loginToken.toString(),
        },
        body: jsonEncode(params));
    if (response.statusCode == 200) {
      Map<String, dynamic> deploymentListMap = jsonDecode(response.body);
      print("detail "+response.body.toString());
      return DeploymentListData.fromJson(deploymentListMap);
    } else {
      throw Exception(failedFetchDeploymentMessage);
    }
  }
}
