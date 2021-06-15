/*
 * @Author: zxj
 * @Date: 2021-06-08 15:15:41
 * @LastEditTime: 2021-06-09 10:03:43
 * @Description: 
 */

import 'package:a_red_book/page/video/video_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class BottomCommentWidget extends StatelessWidget {
  final VideoLogic logic = Get.put(VideoLogic());
  List item = [
    {
      "id": "1",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
    {
      "id": "2",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！weweqwd非发涩发外网访问微风威锋网无法v测人",
      "time": "2021.12.12"
    },
    {
      "id": "3",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
    {
      "id": "4",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
    {
      "id": "5",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀威风威风威风嗡嗡嗡微软微软为！",
      "time": "2021.12.12"
    },
    {
      "id": "6",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
    {
      "id": "7",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
    {
      "id": "8",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
    {
      "id": "9",
      "comName": "c与拾荒者",
      "img":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "com": "我也好想滑雪呀！",
      "time": "2021.12.12"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(750),
      child: GetBuilder<VideoLogic>(
        builder: (logic) => Column(
          children: [
            _headCom(),
            Divider(
              height: 1,
            ),
            _comment(),
            _writeComment(logic.commentbutton),
          ],
        ),
      ),
    );
  }

  Widget _headCom() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Center(
            child: Text("共 6 条评论"),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.close,
                color: Colors.black45,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _comment() {
    return Expanded(
      child: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item[index]["img"]),
              ),
              title: Text(
                "${item[index]["comName"]}",
                style: TextStyle(
                    color: Colors.black54, fontSize: ScreenUtil().setSp(20)),
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: Text(
                      "${item[index]["com"]}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "${item[index]["time"]}",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                ],
              ),
              trailing: Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }

  Widget _writeComment(value) {
    return Container(
      child: Column(
        children: [
          Divider(height: 1),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 8, bottom: 8, right: 20, left: 20),
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().setWidth(430),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "说点什么吧！万一火了呢？",
                            hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(25)),
                            filled: false,
                            isCollapsed: true,
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            logic.controlCommentbutton(value);
                          },
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.alternate_email,
                          size: 20,
                          color: Colors.black54,
                        ),
                      ),
                      Icon(
                        Icons.sentiment_satisfied,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              value == false
                  ? Container()
                  : Container(
                      height: ScreenUtil().setHeight(50),
                      margin: EdgeInsets.only(right: 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[400]),
                          shape: MaterialStateProperty.all(StadiumBorder(
                              side: BorderSide(color: Colors.white, width: 0))),
                        ),
                        child: Text(
                          "发送",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print("发送评论");
                        },
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
