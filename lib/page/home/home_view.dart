/*
 * @Author: zxj
 * @Date: 2021-06-01 15:53:02
 * @LastEditTime: 2021-06-10 15:10:59
 * @Description: 
 */

import 'package:a_red_book/page/find/find_view.dart';
import 'package:a_red_book/page/follow/follow_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController mTabController;
  List mTabList = [
    {"id": 1, "cname": "关注"},
    {"id": 2, "cname": "发现"},
    {"id": 3, "cname": "绵阳"},
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
    return Scaffold(
      body: Container(
        //color: MyColorRes.bgTagColor,
        padding: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: ScreenUtil().setHeight(45),
                  width: ScreenUtil().setWidth(45),
                  margin: EdgeInsets.only(left: 15),
                  child: Image.asset("images/hey_ic_home_menu.png"),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 50,
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
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: <Widget>[
                  FollowPage(),
                  FindPage(),
                  VideoRecommendPage(),
                ],
                controller: mTabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<TabController>('mTabController', mTabController));
  }
}

class VideoRecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
