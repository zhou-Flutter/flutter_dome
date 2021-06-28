/*
 * @Author: zxj
 * @Date: 2021-06-04 14:03:36
 * @LastEditTime: 2021-06-24 14:24:28
 * @Description: 
 */
import 'package:a_red_book/page/shop/components/goods.dart';
import 'package:a_red_book/page/shop/components/shopHead.dart';
import 'package:a_red_book/page/shop/components/shopItem.dart';
import 'package:a_red_book/page/shop/components/shopItem1.dart';
import 'package:a_red_book/page/shop/components/shopSearch.dart';
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
            ShopSearch(),
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
                                ShopHead(),
                                ShopItem(),
                                ShopItem1(),
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
                      ),
                    ];
                  },
                  body: TabBarView(controller: _tabController, children: [
                    Goods(),
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
}
