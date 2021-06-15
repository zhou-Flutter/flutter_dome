/*
 * @Author: zxj
 * @Date: 2021-06-09 11:16:36
 * @LastEditTime: 2021-06-10 14:56:02
 * @Description:  轮播图页面
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

import 'swiper_content_logic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperContentPage extends StatelessWidget {
  final SwiperContentLogic logic = Get.put(SwiperContentLogic());

  List item1 = [
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

  List item = [
    {
      "id": "1",
      "img": "https://img01.jituwang.com/170722/256853-1FH210243772.jpg"
    },
    {
      "id": "2",
      "img": "https://img01.jituwang.com/170627/256884-1F62FP50380.jpg"
    },
    {
      "id": "3",
      "img": "https://img01.jituwang.com/170627/256884-1F62FP50380.jpg"
    },
    {
      "id": "4",
      "img": "https://img01.jituwang.com/170627/256884-1F62FP50380.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setWidth(60),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "C与拾荒者",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(25),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.black12,
                      size: 15,
                    ),
                    Text(
                      "盐城师范学院第三小区",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        actions: [
          Container(
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
          IconButton(
            icon: Icon(
              Icons.launch,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView(
                children: [
                  _swiper(),
                  _textContent(),
                  Divider(height: 1),
                  _commentHead(),
                  _commentHead(),
                  _commentHead(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: _videoComment(),
          )
        ],
      ),
    );
  }

  Widget _commentHead() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("共 125 条评论"),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                height: ScreenUtil().setHeight(55),
                width: ScreenUtil().setWidth(55),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 3, bottom: 3, right: 10, left: 10),
                  decoration: BoxDecoration(
                    color: Color(0x0F000000),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Text(
                    "点赞是喜欢，评论是真爱",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _textContent() {
    return Container(
      padding: EdgeInsets.all(21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "你们的五公里都多久呀，激励我一下！！",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "你们的五公里都多久呀，激励我一下！！你们的五公里都多久呀，激励我一下！！\n你们的五公里都多久呀，激励我一下！！你们的五公里都多久呀，激励我一下！！你们的五公里都多久呀，激励我一下！！",
              style: TextStyle(),
            ),
          ),
          Container(
            child: Row(
              children: [
                Text("06-12"),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(
                        width: ScreenUtil().setWidth(1), color: Colors.black38),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.black26,
                        size: 15,
                      ),
                      Text(
                        "不喜欢",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _swiper() {
    return Container(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            height: ScreenUtil().setHeight(490),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: new Image.network(item[index]["img"]),
                );
              },
              loop: false,
              itemCount: item.length,
              pagination: new SwiperCustomPagination(
                builder: (BuildContext context, SwiperPluginConfig config) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.only(
                          top: 2,
                          bottom: 2,
                          right: 8,
                          left: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          "${config.activeIndex + 1}/${item.length}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: item.asMap().keys.map(
                            (e) {
                              return Container(
                                padding: EdgeInsets.all(1),
                                child: Icon(
                                  Icons.lens,
                                  size: 7,
                                  color: e == config.activeIndex
                                      ? Colors.red
                                      : Colors.black26,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoComment() {
    return Container(
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(350),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Icon(
                  Icons.border_color,
                  color: Colors.black45,
                  size: 20,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "|",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Text(
                  "说点什么吧",
                  style: TextStyle(
                      color: Colors.black45, fontSize: ScreenUtil().setSp(20)),
                )
              ],
            ),
          ),
          Expanded(
            child: LikeButton(
              likeCount: 123,
              likeCountPadding: EdgeInsets.only(left: 0),
              likeBuilder: (bool) {
                if (bool) {
                  return Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  );
                } else {
                  return Icon(
                    Icons.favorite_border,
                    color: Colors.black45,
                    size: 25,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: LikeButton(
              likeCount: 123,
              likeCountPadding: EdgeInsets.only(left: 0),
              likeBuilder: (bool) {
                if (bool) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 28,
                  );
                } else {
                  return Icon(
                    Icons.star_border,
                    color: Colors.black45,
                    size: 28,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                // showBottomComment();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.rate_review,
                    color: Colors.black45,
                    size: 22,
                  ),
                  Container(
                    child: Text(
                      "123",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
