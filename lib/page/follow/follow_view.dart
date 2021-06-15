/*
 * @Author: zxj
 * @Date: 2021-06-10 15:04:48
 * @LastEditTime: 2021-06-10 15:50:38
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'follow_logic.dart';
import 'follow_state.dart';

class FollowPage extends StatelessWidget {
  final FollowLogic logic = Get.put(FollowLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          _headImg(),
          _noFollow(),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "为你推荐",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          _recomFollow(),
          _recomFollow(),
          _recomFollow(),
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
              "分享瞬间",
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
            "还没有关注的人呢",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(26),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "关注后，可以在这里查看对方的最新动态",
            style: TextStyle(
              color: Colors.black45,
              fontSize: ScreenUtil().setSp(23),
            ),
          ),
        ],
      ),
    );
  }

  Widget _recomFollow() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: ScreenUtil().setHeight(70),
              width: ScreenUtil().setWidth(70),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
              ),
            ),
            title: Text("华仔测评"),
            subtitle: Text(
              "笔记·158 |推荐自数码科技",
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
                "关注",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image:
                                "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg"),
                      ),
                      Text("手机照片定位")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image:
                                "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg"),
                      ),
                      Text("手机照片定位")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            fit: BoxFit.cover,
                            image:
                                "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg"),
                      ),
                      Text(
                        "手机照片定位测试机",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
