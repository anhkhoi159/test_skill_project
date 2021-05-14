import 'package:test_project/models/login_data.dart';
import 'package:test_project/resources/login_api_provider.dart';

class LoginRepository{
  final loginApiProvider = LoginApiProvider();

  Future<String> fetchAccessToken() =>  loginApiProvider.getAccessToken();
  Future<LoginData> login( String username,String password) =>loginApiProvider.postLogin(username, password);
}