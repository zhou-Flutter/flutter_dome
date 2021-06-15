/*
 * @Author: zxj
 * @Date: 2021-06-07 16:26:41
 * @LastEditTime: 2021-06-08 15:10:37
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomshareWidget extends StatelessWidget {
  List item = [
    {
      "id": "1",
      "image": "images/sharesdk_icon_friend.png",
      "name": "站内好友",
      "topage": "站内好友"
    },
    {
      "id": "2",
      "image": "images/sharesdk_icon_qq.png",
      "name": "微信好友",
      "topage": "微信好友"
    },
    {
      "id": "3",
      "image": "images/sharesdk_icon_qzone.png",
      "name": "朋友圈",
      "topage": "朋友圈"
    },
    {
      "id": "4",
      "image": "images/sharesdk_icon_wechat_moment.png",
      "name": "QQ好友",
      "topage": ""
    },
    {
      "id": "5",
      "image": "images/sharesdk_icon_wechat.png",
      "name": "QQ空间",
      "topage": ""
    },
  ];
  List item2 = [
    {
      "id": "1",
      "image": "images/sharesdk_icon_cover_shot.png",
      "name": "生成分享图",
      "topage": "站内好友"
    },
    {
      "id": "2",
      "image": "images/sharesdk_icon_download_video.png",
      "name": "下载",
      "topage": "微信好友"
    },
    {
      "id": "3",
      "image": "images/sharesdk_icon_video_speed_setting_c.png",
      "name": "播放速度",
      "topage": "朋友圈"
    },
    {
      "id": "4",
      "image": "images/sharesdk_icon_not_like.png",
      "name": "不喜欢",
      "topage": ""
    },
    {
      "id": "5",
      "image": "images/sharesdk_icon_report.png",
      "name": "举报",
      "topage": ""
    },
    {
      "id": "6",
      "image": "images/sharesdk_icon_settings.png",
      "name": "设置",
      "topage": ""
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(470),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Center(
            child: Text("分享至"),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              children: item.map(
                (e) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        print(e["topage"]);
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 5),
                            height: ScreenUtil().setHeight(80),
                            width: ScreenUtil().setWidth(80),
                            child: Image.asset(e["image"]),
                          ),
                          Text(
                            "${e["name"]}",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Divider(height: 1, color: Colors.black12),
          ),
          Container(
            width: ScreenUtil().setHeight(750),
            height: ScreenUtil().setHeight(180),
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: item2.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 35),
                  child: InkWell(
                    onTap: () {
                      print(item2[index]["topage"]);
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: ScreenUtil().setHeight(80),
                          width: ScreenUtil().setWidth(80),
                          child: Image.asset(item2[index]["image"]),
                        ),
                        Text(
                          "${item2[index]["name"]}",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            child: Divider(height: 1, color: Colors.black12),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 7),
                child: Text(
                  "取消",
                  style: TextStyle(
                      color: Colors.black45, fontSize: ScreenUtil().setSp(30)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
