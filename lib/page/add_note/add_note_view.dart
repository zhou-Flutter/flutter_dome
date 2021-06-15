/*
 * @Author: zxj
 * @Date: 2021-06-11 09:31:31
 * @LastEditTime: 2021-06-11 14:43:02
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'add_note_logic.dart';
import 'package:images_picker/images_picker.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final AddNoteLogic logic = Get.put(AddNoteLogic());

  //控制器
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.black,

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
      ceshi(),
      ceshi(),
      ceshi(),
      ceshi(),
      ceshi(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorSecondary: Colors.white10,
        icon: Center(
          child: Text(
            "直播",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "影集",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "相册",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "短视频",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Text(
            "拍照",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(27)),
          ),
        ),
      ),
    ];
  }
}

class ceshi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          getImage();
        },
        child: Text("data"),
      ),
    );
  }

  Future getImage() async {
    List<Media> res = await ImagesPicker.pick(
      count: 3,
      pickType: PickType.image,
    );
  }
}
