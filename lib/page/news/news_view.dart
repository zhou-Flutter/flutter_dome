/*
 * @Author: zxj
 * @Date: 2021-06-04 14:08:56
 * @LastEditTime: 2021-06-05 10:54:16
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'news_logic.dart';

class NewsPage extends StatelessWidget {
  final NewsLogic logic = Get.put(NewsLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "消息",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w100,
              fontSize: ScreenUtil().setSp(30)),
        ),
        actions: [
          Container(
            width: 100,
            child: IconButton(
              icon: Text(
                "创建聊天",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            _newsHead(),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                height: 1,
                color: Colors.black12,
              ),
            ),
            _newsList(),
          ],
        ),
      ),
    );
  }

  //消息列表
  Widget _newsList() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: Image.asset("images/im_chat_push_notification_ic_v2.png"),
            title: Text("推送消息"),
            subtitle: Text("用户调用，小红书诚要你参与调查"),
            trailing: Text("05-26"),
          ),
          ListTile(
            leading: Image.asset("images/im_chat_sys_notification_ic_v2.png"),
            title: Text("系统通知"),
            subtitle: Text("协议更新通知"),
            trailing: Text("04-29"),
          )
        ],
      ),
    );
  }

  //头部菜单
  Widget _newsHead() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(70),
                  width: ScreenUtil().setWidth(70),
                  margin: EdgeInsets.all(10),
                  child: Image.asset("images/im_chat_like_collect_ic_v2.png"),
                ),
                Text("赞和收藏")
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(70),
                  width: ScreenUtil().setWidth(70),
                  margin: EdgeInsets.all(10),
                  child: Image.asset("images/im_chat_comment_at_ic_v2.png"),
                ),
                Text("新增关注")
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: ScreenUtil().setHeight(70),
                  width: ScreenUtil().setWidth(70),
                  margin: EdgeInsets.all(10),
                  child: Image.asset("images/im_chat_fans_ic_v2.png"),
                ),
                Text("评论和@")
              ],
            ),
          )
        ],
      ),
    );
  }
}
