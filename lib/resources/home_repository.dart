import 'package:test_project/models/deployment_data.dart';
import 'package:test_project/resources/home_api_provider.dart';

class HomeRepository{
  final homeApiProvider = HomeApiProvider();
  
  Future<DeploymentListData> fetchDeploymentList() => homeApiProvider.getDeploymentList();
}