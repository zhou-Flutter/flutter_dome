/*
 * @Author: zxj
 * @Date: 2021-06-26 13:11:48
 * @LastEditTime: 2021-06-27 16:46:58
 * @Description: 
 */
import 'package:a_red_book/page/record/components/mianContent.dart';
import 'package:a_red_book/page/record/components/slivContent.dart';
import 'package:a_red_book/page/record/components/sliverbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'record_logic.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'record_state.dart';

class RecordPage extends StatelessWidget {
  final RecordLogic logic = Get.put(RecordLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        leading: Container(
          margin: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "记录我的日常",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(25),
              ),
            ),
            Text(
              "还没有记录",
              style: TextStyle(
                color: Colors.white70,
                fontSize: ScreenUtil().setSp(20),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: _slivertabbar1(),
      ),
    );
  }

  Widget _slivertabbar1() {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          ExtendedSliverAppbar(
            leading: Text(''),
            toolBarColor: Color(0xFF1A3445),
            toolbarHeight: ScreenUtil().setHeight(209),
            title: Sliverbar(),
            background: SlivContent(),
          ),
          SliverPinnedToBoxAdapter(
            child: Container(
              color: Colors.black,
              height: ScreenUtil().setHeight(1200),
              child: MainContext(),
            ),
          ),
        ],
      ),
    );
  }

  //

  Widget _slivertabbar() {
    return Container(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              primary: true,
              title: Container(
                color: Colors.black,
                child: Text("data"),
              ),
              forceElevated: innerBoxIsScrolled,
              toolbarHeight: ScreenUtil().setHeight(300),
              expandedHeight: ScreenUtil().setHeight(500),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: Colors.black45,
                  child: Text(
                    "data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
            child: Column(
          children: [
            Text("data"),
          ],
        )),
      ),
    );
  }
}
