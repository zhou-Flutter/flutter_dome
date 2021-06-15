/*
 * @Author: zxj
 * @Date: 2021-06-02 13:56:48
 * @LastEditTime: 2021-06-06 11:43:03
 * @Description:  推荐
 * 
 */
import 'package:a_red_book/config/data/recommendList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'recommend_logic.dart';
import 'package:like_button/like_button.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class RecommendPage extends StatelessWidget {
  final RecommendLogic logic = Get.put(RecommendLogic());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendLogic>(
      builder: (logic) => Container(
        child: WaterfallFlow.builder(
          itemCount: logic.recommendList.length,
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return videoLayout(logic.recommendList[index]);
          },
        ),
      ),
    );
  }

  Widget videoLayout(item) {
    return InkWell(
      onTap: () {
        logic.tocontentPage(item["ismp4"]);
      },
      child: Container(
        width: ScreenUtil().setWidth(367),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: ScreenUtil().setHeight(item["imgHight"]),
                    width: ScreenUtil().setWidth(item["imgWidth"]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover,
                        image: item["coverImg"],
                      ),
                    ),
                  ),
                  item["ismp4"] != true
                      ? Text("")
                      : Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black26,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                item["name"],
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Icon(Icons.ac_unit),
                  Text("${item["write"]}"),
                  Spacer(),
                  LikeButton(
                    likeCount: int.parse(item["like"]),
                    likeCountPadding: EdgeInsets.only(left: 0),
                    likeBuilder: (bool) {
                      if (bool) {
                        return Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 22,
                        );
                      } else {
                        return Icon(
                          Icons.favorite_border,
                          color: Colors.black26,
                          size: 22,
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
