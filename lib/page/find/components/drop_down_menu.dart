/*
 * @Author: zxj
 * @Date: 2021-06-04 16:12:46
 * @LastEditTime: 2021-06-04 20:35:44
 * @Description: 
 */
import 'package:easy_popup/easy_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DropDownMenu extends StatefulWidget with EasyPopupChild {
  final _PopController controller = _PopController();

  @override
  _DropDownMenuState createState() => _DropDownMenuState();

  @override
  dismiss() {
    controller.dismiss();
  }
}

class _DropDownMenuState extends State<DropDownMenu>
    with SingleTickerProviderStateMixin {
  Animation<Offset> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    widget.controller._bindState(this);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  dismiss() {
    _controller?.reverse();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  List menu = [
    {"id": "1", "name": "推荐", "gd": "true"},
    {"id": "2", "name": "视频", "gd": "true"},
    {"id": "3", "name": "直播", "gd": "true"},
    {"id": "4", "name": "汽车", "gd": "false"},
    {"id": "5", "name": "Vlog", "gd": "false"},
    {"id": "6", "name": "绘画", "gd": "false"},
    {"id": "7", "name": "旅行", "gd": "false"},
    {"id": "8", "name": "搞笑", "gd": "false"},
    {"id": "9", "name": "穿搭", "gd": "false"},
  ];
  List menu2 = [
    {"id": "1", "name": "音乐"},
    {"id": "2", "name": "母婴"},
    {"id": "3", "name": "萌娃"},
    {"id": "4", "name": "美甲"},
    {"id": "5", "name": "彩妆"},
    {"id": "6", "name": "情感"},
    {"id": "7", "name": "运动健身"},
    {"id": "8", "name": "手工"},
    {"id": "9", "name": "文具手账"},
    {"id": "9", "name": "萌宠"},
    {"id": "9", "name": "科技数码"},
    {"id": "9", "name": "发型"},
    {"id": "9", "name": "明星"},
    {"id": "9", "name": "家具家装"},
  ];
  // EasyPopup.pop(context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
        child: ClipRect(
          child: SlideTransition(
            position: _animation,
            child: Container(
              color: Colors.white,
              height: ScreenUtil().setHeight(800),
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: [
                  _downMenuHead(),
                  Wrap(
                    spacing: 15.0,
                    runSpacing: 15.0,
                    children: menu.map((e) {
                      return menuItem(e);
                    }).toList(),
                  ),
                  _downMenuHead2(),
                  Wrap(
                    spacing: 15.0,
                    runSpacing: 15.0,
                    children: menu2.map((e) {
                      return menuItem2(e);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //菜单1的孩子
  Widget menuItem(item) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(150),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        // margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: item["gd"] == "true" ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: item["gd"] == "true" ? Colors.white : Colors.black12,
            width: 1,
          ),
        ),
        child: Text(
          "${item["name"]}",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
          ),
        ),
      ),
    );
  }

  //菜单2的孩子
  Widget menuItem2(item) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(150),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        // margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
        child: Text(
          "+${item["name"]}",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
          ),
        ),
      ),
    );
  }

  //下拉菜单
  Widget _downMenuHead() {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5, bottom: 15),
      child: Row(
        children: [
          Text(
            "我的频道",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.w600),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "点击进入频道",
              style: TextStyle(
                  color: Colors.black45, fontSize: ScreenUtil().setSp(20)),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                "进入编辑",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                EasyPopup.pop(context);
              },
              child: Icon(Icons.expand_less),
            ),
          )
        ],
      ),
    );
  }

  Widget _downMenuHead2() {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5, bottom: 15, top: 15),
      child: Row(
        children: [
          Text(
            "推荐频道",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(25), fontWeight: FontWeight.w600),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "点击添加频道",
              style: TextStyle(
                  color: Colors.black45, fontSize: ScreenUtil().setSp(20)),
            ),
          ),
        ],
      ),
    );
  }

  //底部
}

class _PopController {
  _DropDownMenuState state;

  _bindState(_DropDownMenuState state) {
    this.state = state;
  }

  dismiss() {
    state?.dismiss();
  }
}
