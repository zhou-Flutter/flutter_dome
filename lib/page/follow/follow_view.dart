/*
 * @Author: zxj
 * @Date: 2021-06-10 15:04:48
 * @LastEditTime: 2021-06-10 15:50:38
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'follow_logic.dart';
import 'follow_state.dart';

class FollowPage extends StatelessWidget {
  final FollowLogic followLogic = Get.put(FollowLogic());

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
          followLogic.getRecommend();
        },
        onLoad: () async {
          followLogic.getMore();
        },
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  child: GetBuilder<FollowLogic>(
                    builder: (followLogic) => Container(
                      child: Column(
                        children: [
                          _headImg(),
                          _noFollow(),
                          _recomFollow(followLogic.recommendAuthor),
                        ],
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

  Widget _headImg() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(100),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              "????????????",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(21),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _noFollow() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      color: Color(0x08000000),
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: [
          Text(
            "????????????????????????",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "??????????????????????????????????????????????????????",
            style: TextStyle(
              color: Colors.black45,
              fontSize: ScreenUtil().setSp(23),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recomFollow(list) {
    return Container(
      child: Column(
        children: list.map<Widget>((e) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: ScreenUtil().setHeight(70),
                    width: ScreenUtil().setWidth(70),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${e["avatar"]}"),
                    ),
                  ),
                  title: Text("${e["author"]}"),
                  subtitle: Text(
                    "${e["describe"]}",
                    style: TextStyle(color: Colors.black38),
                  ),
                  trailing: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(100),
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1, color: Colors.red)),
                    child: Text(
                      "??????",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: e["works"].map<Widget>((e) {
                    return Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  fit: BoxFit.cover,
                                  image: "${e["covers"]}"),
                            ),
                            Text("${e["describe"]}")
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget _recomFollow1() {
  //   return Container(
  //     padding: EdgeInsets.all(5),
  //     child: Column(
  //       children: [
  //         ListTile(
  //           leading: Container(
  //             height: ScreenUtil().setHeight(70),
  //             width: ScreenUtil().setWidth(70),
  //             child: CircleAvatar(
  //               backgroundImage: NetworkImage(
  //                   "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
  //             ),
  //           ),
  //           title: Text("????????????"),
  //           subtitle: Text(
  //             "????????158 |?????????????????????",
  //             style: TextStyle(color: Colors.black38),
  //           ),
  //           trailing: Container(
  //             alignment: Alignment.center,
  //             width: ScreenUtil().setWidth(100),
  //             margin: EdgeInsets.only(top: 15, bottom: 15),
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.all(Radius.circular(20)),
  //                 border: Border.all(width: 1, color: Colors.red)),
  //             child: Text(
  //               "??????",
  //               style: TextStyle(
  //                 color: Colors.red,
  //                 fontSize: ScreenUtil().setSp(20),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Container(
  //                 padding: EdgeInsets.all(5),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.all(Radius.circular(10)),
  //                       child: FadeInImage.memoryNetwork(
  //                           placeholder: kTransparentImage,
  //                           fit: BoxFit.cover,
  //                           image:
  //                               "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg"),
  //                     ),
  //                     Text("??????????????????")
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 padding: EdgeInsets.all(5),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.all(Radius.circular(10)),
  //                       child: FadeInImage.memoryNetwork(
  //                           placeholder: kTransparentImage,
  //                           fit: BoxFit.cover,
  //                           image:
  //                               "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg"),
  //                     ),
  //                     Text("??????????????????")
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Container(
  //                 padding: EdgeInsets.all(5),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.all(Radius.circular(10)),
  //                       child: FadeInImage.memoryNetwork(
  //                           placeholder: kTransparentImage,
  //                           fit: BoxFit.cover,
  //                           image:
  //                               "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg"),
  //                     ),
  //                     Text(
  //                       "???????????????????????????",
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
