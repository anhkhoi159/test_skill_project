import 'package:flutter/material.dart';

import 'home_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                icon: Icon(Icons.notifications_none, color: Colors.black),
                iconMargin: EdgeInsets.only(top: 20),
              ),
              Tab(icon: Icon(Icons.wb_twighlight, color: Colors.black)),
            ],
          ),
          body: TabBarView(
            children: [
              HomeDetail(),
              Icon(Icons.notifications_none),
              Icon(Icons.cloud_circle_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
