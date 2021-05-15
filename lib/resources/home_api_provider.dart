import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/models/deployment_data.dart';
import 'package:http/http.dart' as http;
import 'constants/constant.dart';

class HomeApiProvider {
  Future<DeploymentListData> getDeploymentList() async {
    final prefs = await SharedPreferences.getInstance();
    String loginToken =await bearerX +  prefs.getString("login_token");
    String funtiongetData = prefs.getString("name");
    String accessToken = await bearer +  prefs.getString("access_token");
    var params = {"Type": 0, username: funtiongetData};
    
    var url =
        Uri.https(baseUrl, "su2-wsmobinetautostag/MobiNet_GetListDepMain/POST");

    var response = await http.post(url,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: contentnType,
          HttpHeaders.authorizationHeader: accessToken,
          authorizationX: loginToken,
        },
        body: jsonEncode(params));
    if (response.statusCode == 200) {
      Map<String, dynamic> deploymentListMap = jsonDecode(response.body);
      return DeploymentListData.fromJson(deploymentListMap);
    } else {
      throw Exception(failedFetchDeploymentMessage);
    }
  }
}
