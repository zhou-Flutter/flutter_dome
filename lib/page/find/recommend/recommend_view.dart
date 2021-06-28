/*
 * @Author: zxj
 * @Date: 2021-06-02 13:56:48
 * @LastEditTime: 2021-06-28 20:49:24
 * @Description:  推荐
 * 
 */
import 'dart:ui';

import 'package:a_red_book/config/components/note_item.dart';
import 'package:a_red_book/config/data/recommendList.dart';
import 'package:a_red_book/page/mycenter/components/drawerMenu.dart';
import 'package:a_red_book/page/video/video_logic.dart';
import 'package:a_red_book/page/video/video_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'recommend_logic.dart';
import 'package:like_button/like_button.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RecommendPage extends StatelessWidget {
  final RecommendLogic logic = Get.put(RecommendLogic());
  final VideoLogic logicv = Get.put(VideoLogic());
  var globalKey;
  RecommendPage({this.globalKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.custom(
        header: MaterialHeader(),
        footer: ClassicalFooter(
          extent: 30,
          showInfo: false,
          safeArea: false,
          textColor: Colors.white,
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            logic.getRecommendList();
          });
        },
        onLoad: () async {
          logic.getaddRecommendList();
        },
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: GetBuilder<RecommendLogic>(
                    builder: (logic) => Container(
                      child: WaterfallFlow.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 0),
                        itemCount: logic.recommendList.length,
                        gridDelegate:
                            SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return videoLayout(logic.recommendList[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget videoLayout(item) {
    return NoteItem(
      item: item,
      onTap: () {
        // Scaffold.of(context).openEndDrawer();
        logicv.getdt("1234");
        globalKey.currentState.openEndDrawer();
        // logic.tocontentPage(item["ismp4"]);
      },
    );
  }
}
