/*
 * @Author: zxj
 * @Date: 2021-06-02 10:54:07
 * @LastEditTime: 2021-06-27 18:38:10
 * @Description: 发现页
 */

import 'package:a_red_book/page/find/recommend/recommend_view.dart';
import 'package:a_red_book/page/mycenter/components/drawerMenu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/drop_down_menu.dart';
import 'find_logic.dart';
import 'package:easy_popup/easy_popup.dart';
import 'package:extended_tabs/extended_tabs.dart';

class FindPage extends StatefulWidget {
  Key globalKey;
  FindPage({this.globalKey});

  @override
  _FindPageState createState() => _FindPageState(this.globalKey);
}

class _FindPageState extends State<FindPage> with TickerProviderStateMixin {
  final FindLogic logic = Get.put(FindLogic());
  ScrollController _controller = ScrollController();
  Key globalKey;
  _FindPageState(this.globalKey);

  TabController mTabController;
  List mTabList = [
    {"id": 1, "cname": "推荐"},
    {"id": 2, "cname": "视频"},
    {"id": 3, "cname": "发现"},
    {"id": 4, "cname": "发现"},
    {"id": 5, "cname": "发现"},
    {"id": 6, "cname": "发现"},
    {"id": 7, "cname": "发现"},
    {"id": 8, "cname": "发现"},
  ];
  bool isScroll = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mTabController = TabController(length: mTabList.length, vsync: this);
    mTabController.index = 0;
    mTabController.addListener(() {
      print(mTabController.offset);
    });

    // 监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset == 49.185113497447105) {
        setState(() {
          isScroll = false;
        });
      }
      if (_controller.offset == 0.0) {
        setState(() {
          isScroll = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                floating: false,
                primary: false,
                toolbarHeight: ScreenUtil().setHeight(15),
                backgroundColor: Colors.white,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Container(
                    padding: EdgeInsets.only(top: 9, bottom: 9),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 9,
                          child: ExtendedTabBar(
                            isScrollable: true,
                            indicatorColor: Colors.white,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black38,
                            labelStyle: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
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
                                offsetLT: Offset(
                                    0, MediaQuery.of(context).padding.top + 50),
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
                ),
              ),
            ];
          },
          body: ExtendedTabBarView(
            physics: isScroll == true ? null : NeverScrollableScrollPhysics(),
            children: <Widget>[
              RecommendPage(globalKey: globalKey),
              RecommendPage(globalKey: globalKey),
              RecommendPage(globalKey: globalKey),
              VideoRecommendPage(),
              VideoRecommendPage(),
              VideoRecommendPage(),
              VideoRecommendPage(),
              VideoRecommendPage(),
            ],
            controller: mTabController,
          ),
        ),
      ),
    );

    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       Container(
    //         padding: EdgeInsets.only(top: 9, bottom: 9),
    //         child: Flex(
    //           direction: Axis.horizontal,
    //           children: [
    //             Expanded(
    //               flex: 10,
    //               child: ExtendedTabBar(
    //                 isScrollable: true,
    //                 indicatorColor: Colors.white,
    //                 labelColor: Colors.black,
    //                 unselectedLabelColor: Colors.black38,
    //                 labelStyle:
    //                     TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    //                 unselectedLabelStyle: TextStyle(fontSize: 15.0),
    //                 indicatorSize: TabBarIndicatorSize.label,
    //                 controller: mTabController,
    //                 tabs: mTabList.map((value) {
    //                   return Container(
    //                     child: Text(value["cname"]),
    //                   );
    //                 }).toList(),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 1,
    //               child: InkWell(
    //                 onTap: () {
    //                   EasyPopup.show(
    //                     context,
    //                     DropDownMenu(),
    //                     offsetLT:
    //                         Offset(0, MediaQuery.of(context).padding.top + 50),
    //                   );
    //                 },
    //                 child: Container(
    //                   padding: EdgeInsets.only(right: 10),
    //                   child: Icon(
    //                     Icons.expand_more,
    //                     size: 25,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Divider(
    //         height: 1,
    //       ),
    //       Expanded(
    //         flex: 1,
    //         child: ExtendedTabBarView(
    //           children: <Widget>[
    //             RecommendPage(),
    //             VideoRecommendPage(),
    //             VideoRecommendPage(),
    //             VideoRecommendPage(),
    //             VideoRecommendPage(),
    //             VideoRecommendPage(),
    //             VideoRecommendPage(),
    //             VideoRecommendPage(),
    //           ],
    //           controller: mTabController,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
