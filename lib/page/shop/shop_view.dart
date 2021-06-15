/*
 * @Author: zxj
 * @Date: 2021-06-04 14:03:36
 * @LastEditTime: 2021-06-15 10:06:36
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import 'shop_logic.dart';
import 'shop_state.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  final ShopLogic logic = Get.put(ShopLogic());

  ScrollController _scrollViewController;
  TabController _tabController;
  List tabItem = [
    {"id": "1", "title": "推荐", "name": "猜你喜欢"},
    {"id": "2", "title": "活动", "name": "限时抢购"},
    {"id": "3", "title": "推荐", "name": "猜你喜欢"},
    {"id": "4", "title": "推荐", "name": "猜你喜欢"},
    {"id": "5", "title": "推荐", "name": "猜你喜欢"},
    {"id": "6", "title": "推荐", "name": "猜你喜欢"},
    {"id": "7", "title": "推荐", "name": "猜你喜欢"},
  ];
  var tabindex = 0;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: tabItem.length);
    _tabController.addListener(() {
      _tabController.index;
      print(_tabController.index);
      setState(() {
        tabindex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          print('FloatingActionButton');
        },
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            shopSearch(),
            Container(
              child: Expanded(
                child: NestedScrollView(
                  controller: _scrollViewController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        pinned: true,
                        floating: true,
                        primary: false,
                        elevation: 5,
                        forceElevated: innerBoxIsScrolled,
                        backgroundColor: Colors.white,
                        expandedHeight: ScreenUtil().setHeight(1350),
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          background: Container(
                            color: Color(0x09000000),
                            child: ListView(
                              padding: EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                shopHead(),
                                shopItem(),
                                shopItem1(),
                              ],
                            ),
                          ),
                        ),
                        bottom: TabBar(
                          isScrollable: true,
                          indicator: BubbleTabIndicator(
                            padding: EdgeInsets.only(
                              top: -15,
                              left: 8,
                              right: 8,
                              bottom: 15,
                            ),
                            indicatorColor: Colors.red,
                          ),
                          indicatorColor: Colors.white,
                          labelColor: Colors.white,
                          unselectedLabelColor: Color(0xff666666),
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontWeight: FontWeight.w600,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          controller: _tabController,
                          tabs: tabItem.asMap().keys.map((e) {
                            return Tab(
                                icon: Text(
                                  tabItem[e]["title"],
                                  style: TextStyle(
                                    color: tabindex == e
                                        ? Colors.red
                                        : Colors.black,
                                    fontSize: ScreenUtil().setSp(25),
                                  ),
                                ),
                                text: tabItem[e]["name"]);
                          }).toList(),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(controller: _tabController, children: [
                    _buildListView("aaa:"),
                    _buildListView("bbb:"),
                    _buildListView("ccc:"),
                    _buildListView("aaa:"),
                    _buildListView("bbb:"),
                    _buildListView("ccc:"),
                    _buildListView("aaa:"),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
      itemCount: 20,
      padding: EdgeInsets.all(0),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey,
        height: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            color: Colors.white, child: ListTile(title: Text("$s第$index 个条目")));
      },
    );
  }

  Widget shopItem1() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(500),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.red),
                color: Colors.white,
              ),
              child: Text("直播分享会"),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(240),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.red),
                    color: Colors.white,
                  ),
                  child: Text("data"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(240),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.red),
                    color: Colors.white,
                  ),
                  child: Text("data"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget shopItem() {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.red),
                color: Colors.white,
              ),
              child: Text("新人一元抢购"),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Text("提前强会场"),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Text("爆款分期免息"),
            ),
          ),
        ],
      ),
    );
  }

  Widget shopHead() {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(220),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("心动红包"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(220),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("小清单"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("大咖直播间"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("提前强会场"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("爆款分期免息"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //头部搜索栏
  Widget shopSearch() {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.post_add,
                  color: Colors.black54,
                  size: 23,
                ),
                Text(
                  "订单",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(500),
              padding: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
              margin: EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0x0f000000),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.black26,
                  ),
                  Text(
                    "大家都在搜，美妆天花板",
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.black54,
                  size: 25,
                ),
                Text(
                  "更多",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
