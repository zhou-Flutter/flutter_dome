/*
 * @Author: zxj
 * @Date: 2021-06-01 11:32:32
 * @LastEditTime: 2021-06-11 09:41:04
 * @Description:  
 */
import 'package:a_red_book/page/home/home_view.dart';
import 'package:a_red_book/page/mycenter/components/drawerMenu.dart';
import 'package:a_red_book/page/mycenter/mycenter_view.dart';
import 'package:a_red_book/page/news/news_view.dart';
import 'package:a_red_book/page/shop/shop_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:get/get.dart';

import 'index_logic.dart';
import 'index_state.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  //控制器
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // 适配屏幕
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        orientation: Orientation.portrait);
    return Scaffold(
      drawer: DrawerMenu(),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(5.0),
          colorBehindNavBar: Colors.black,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 1),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      ShopPage(),
      HomePage(),
      NewsPage(),
      MycenterPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "首页",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "商城",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Icon(Icons.add),
            onPressed: () {
              Get.toNamed("/addNotePage");
            },
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "消息",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "我",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
    ];
  }
}
