import 'package:flutter/material.dart';

import 'deployment_page.dart';
import 'home_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool inDetailDeployment = false;
  @override
  void initState() {
    super.initState();
    // homeBloc.getDeploymentData();

  }


  // set string(String value) => setState(() => _string = value);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              )),
              Tab(
                icon: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child:
                          Icon(Icons.notifications_none, color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(1, 4, 1, 4),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text("5",
                              style: TextStyle(
                                color: Colors.white,
                              ))),
                    )
                  ],
                ),
              ),
              Tab(
                icon: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Icon(Icons.wb_twighlight, color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Container(
                          padding: EdgeInsets.fromLTRB(1, 4, 1, 4),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text("10",
                              style: TextStyle(
                                color: Colors.white,
                              ))),
                    )
                  ],
                ),
              ),
              // Tab(icon: Icon(Icons.wb_twighlight, color: Colors.black)),
            ],
          ),
          body: TabBarView(
            children: [
              inDetailDeployment
                  ? DeploymentListDetail(
                      gotoHomeDetail: () =>
                          setState(() => inDetailDeployment = false),
                    )
                  : HomeDetail(
                      gotoDetailDeployment: () =>
                          setState(() => inDetailDeployment = true),
                    ),
              Icon(Icons.notifications_none),
              Icon(Icons.cloud_circle_outlined),
            ],
          ),
        ),
      ),
    );
  }

}
