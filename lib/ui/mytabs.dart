import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharmacy/ui/widgets/custom_appbar.dart';
import 'package:pharmacy/ui/widgets/custom_navigation_drawer.dart';
import 'package:http/http.dart' as http;

import 'mapview.dart';

class MyTabsPage extends StatefulWidget {
  MyTabsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyTabsPageState createState() => _MyTabsPageState();
}

class _MyTabsPageState extends State<MyTabsPage> with SingleTickerProviderStateMixin {
  //Future<pojoMyTabs> result;
  bool isLoading = true;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);

  }

  @override Widget build(BuildContext context) {
    return Material(

      child:
      DefaultTabController(
        length: 3,
        child: Scaffold(
         // key: scaffoldKey,
          appBar: CustomAppBar(
              title: 'My Tabs',
              con: context,
          ),
          drawer: CustomNavigationDrawer(),
          body: Column(
            children: [
              Container(
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Color(0xFF00275E),
                  indicatorColor: Color(0xFF00275E),
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: new Text("MapView", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: new Text("DataTable", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: TabBarView(
                  children: [
                    MyMapPage(title : 'Map'),

                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
