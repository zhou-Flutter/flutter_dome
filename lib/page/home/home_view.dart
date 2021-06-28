/*
 * @Author: zxj
 * @Date: 2021-06-01 15:53:02
 * @LastEditTime: 2021-06-27 18:25:22
 * @Description: 
 */

import 'package:a_red_book/page/find/find_view.dart';
import 'package:a_red_book/page/find/recommend/recommend_view.dart';
import 'package:a_red_book/page/follow/follow_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:get/get.dart';

import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  Key globalKey;
  HomePage({this.globalKey});

  @override
  _HomePageState createState() => _HomePageState(this.globalKey);
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController mTabController;
  TabController tabController1;
  Key globalKey;
  _HomePageState(this.globalKey);

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
    tabController1 = TabController(length: 3, vsync: this);
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
  void dispose() {
    mTabController.dispose();
    tabController1.dispose();
    super.dispose();
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
                InkWell(
                  onTap: () {
                    // Scaffold.of(context).openEndDrawer();
                    Get.toNamed("/recordPage");
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(45),
                    width: ScreenUtil().setWidth(45),
                    margin: EdgeInsets.only(left: 15),
                    child: Image.asset("images/hey_ic_home_menu.png"),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: ExtendedTabBar(
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
              child: ExtendedTabBarView(
                children: <Widget>[
                  FollowPage(),
                  FindPage(globalKey: globalKey),
                  RecommendPage(globalKey: globalKey),
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
