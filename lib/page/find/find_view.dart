/*
 * @Author: zxj
 * @Date: 2021-06-02 10:54:07
 * @LastEditTime: 2021-06-16 10:07:59
 * @Description: 发现页
 */

import 'package:a_red_book/page/find/recommend/recommend_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/drop_down_menu.dart';
import 'find_logic.dart';
import 'package:easy_popup/easy_popup.dart';

class FindPage extends StatefulWidget {
  FindPage({Key key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> with TickerProviderStateMixin {
  final FindLogic logic = Get.put(FindLogic());

  TabController mTabController;
  List mTabList = [
    {"id": 1, "cname": "推荐"},
    {"id": 2, "cname": "发现"},
    {"id": 3, "cname": "发现"},
    {"id": 4, "cname": "发现"},
    {"id": 5, "cname": "发现"},
    {"id": 6, "cname": "发现"},
    {"id": 7, "cname": "发现"},
    {"id": 8, "cname": "发现"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mTabController = TabController(length: mTabList.length, vsync: this);
    mTabController.index = 0;
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
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 9, bottom: 9),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 10,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black38,
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
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      EasyPopup.show(
                        context,
                        DropDownMenu(),
                        offsetLT:
                            Offset(0, MediaQuery.of(context).padding.top + 50),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.expand_more,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: <Widget>[
                RecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage(),
                VideoRecommendPage(),
              ],
              controller: mTabController,
            ),
          ),
        ],
      ),
    );
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
