import 'dart:async';

import 'package:test_project/models/deployment_data.dart';
import 'package:test_project/resources/home_repository.dart';

class HomeBloc{
  final homeRepository = HomeRepository();
  final _homeController = StreamController();
  Stream<String> get accessTokenController => _homeController.stream;

  Future<DeploymentListData> getDeploymentData() async{
   var deploymentListData = homeRepository.fetchDeploymentList();
   return deploymentListData;
}
  dispose() {
    _homeController.close();

  }
}
final homeBloc = HomeBloc();