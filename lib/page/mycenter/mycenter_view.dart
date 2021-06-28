/*
 * @Author: zxj
 * @Date: 2021-06-04 14:15:44
 * @LastEditTime: 2021-06-28 18:56:26
 * @Description:个人中心
 */
import 'dart:ui';

import 'package:a_red_book/page/mycenter/components/headInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/collection.dart';

import 'components/drawerMenu.dart';
import 'mycenter_logic.dart';
import 'package:extended_sliver/extended_sliver.dart';

class MycenterPage extends StatelessWidget {
  Key globalKey;
  MycenterPage({this.globalKey});

  final MycenterLogic logic = Get.put(MycenterLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ExtendedSliverAppbar(
            toolBarColor: Color(0xFF1A3445),
            title: Container(
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setWidth(60),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
              ),
            ),
            leading: _leading(context),
            background: Container(
              width: double.maxFinite,
              height: ScreenUtil().setHeight(450),
              color: Color(0xFF1A3445),
              child: HeadInfo(),
            ),
            actions: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.launch,
                color: Colors.white,
              ),
            ),
          ),
          SliverPinnedToBoxAdapter(
            child: Container(
              color: Color(0xFF1A3445),
              height: ScreenUtil().setHeight(1200),
              child: Collection(globalKey: globalKey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _leading(context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
        // _globalKey.currentState.openDrawer();
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }
}
