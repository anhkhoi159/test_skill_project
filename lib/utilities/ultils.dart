
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/BloC/login_bloc.dart';

  Future<String> checkAccessToken()async{
  final prefs = await SharedPreferences.getInstance();
  String before = prefs.getString("time_access");
  if(before!=null && DateTime.now().difference(DateTime.parse(before)).inMilliseconds>=120000){
     loginBloc.getAccesstoken();
  }
    return "";
}
Future<bool> checkIsLogin() async{
  final prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool("is_login");

  if(isLogin){
    String before = prefs.getString("time_out");
    if(before!=null && DateTime.now().difference(DateTime.parse(before)).inMilliseconds>=300000){
      prefs.remove("name");
      prefs.setBool("is_login", false);
      return false;
    }
  }
  return isLogin;
}