/*
 * @Author: zxj
 * @Date: 2021-06-06 10:47:00
 * @LastEditTime: 2021-06-09 10:51:33
 * @Description: 
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> with TickerProviderStateMixin {
  TabController mTabController;
  List mTabList = [
    {"id": 1, "cname": "笔记"},
    {"id": 2, "cname": "收藏"},
    {"id": 3, "cname": "赞过"},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mTabController = TabController(length: mTabList.length, vsync: this);
    mTabController.index = 1;
    // setState(() {
    //   // mTabList = mList;
    //   mTabController = TabController(length: mTabList.length, vsync: this);
    // });
    // mTabController.addListener(() {
    //   _currentTopTabIndex = _tabController.index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.red,
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xff666666),
              labelStyle:
                  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              unselectedLabelStyle: TextStyle(fontSize: 15.0),
              indicatorSize: TabBarIndicatorSize.label,
              controller: mTabController,
              tabs: mTabList.map((value) {
                return Container(
                  child: Text(value["cname"]),
                );
              }).toList(),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black12,
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                VideoRecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage()
              ],
              controller: mTabController,
            ),
          )
        ],
      ),
    );
  }
}

class VideoRecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
    );
  }
}
