/*
 * @Author: zxj
 * @Date: 2021-06-06 11:00:18
 * @LastEditTime: 2021-06-26 11:58:55
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/videoitem.dart';
import 'video_logic.dart';
import 'video_state.dart';

class VideoPage extends StatelessWidget {
  final VideoLogic logic = Get.put(VideoLogic());
  List list = ["第一页", "第二页", "第三页", "第四页", "第五页"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: PageView.builder(
        /// pageview中 子条目的个数
        itemCount: list.length,

        /// 上下滑动
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return buildPageViewItemWidget(list[index]);
        },
      ),
    );
  }

  Widget buildPageViewItemWidget(list) {
    return Container(child: VideoItem());
  }
}
