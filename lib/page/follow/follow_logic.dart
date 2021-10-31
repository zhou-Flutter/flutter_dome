/*
 * @Author: zxj
 * @Date: 2021-06-10 15:04:48
 * @LastEditTime: 2021-06-10 15:05:05
 * @Description: 
 */
import 'package:get/get.dart';

import 'follow_state.dart';

class FollowLogic extends GetxController {
  List recommendAuthor = [];
  List recommend = [
    {
      "id": 0,
      "author": "华仔测评",
      "avatar":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "describe": "笔记·158 |推荐自数码科技",
      "works": [
        {
          "describe": "手机照片定位测试机",
          "covers": "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
        },
        {
          "describe": "手机照片定位测试机",
          "covers": "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
        },
        {
          "describe": "手机照片定位测试机",
          "covers": "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
        },
      ]
    },
    {
      "id": 1,
      "author": "华仔测评",
      "avatar":
          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
      "describe": "笔记·158 |推荐自数码科技",
      "works": [
        {
          "describe": "手机照片定位测试机",
          "covers": "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
        },
        {
          "describe": "手机照片定位测试机",
          "covers": "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
        },
        {
          "describe": "手机照片定位测试机",
          "covers": "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
        },
      ]
    },
  ];
  int page = 1;
  @override
  void onReady() async {
    super.onReady();
    getRecommend();
  }

  //获取推荐数据
  getRecommend() async {
    await Future.delayed(Duration(seconds: 1));
    page = 1;
    recommendAuthor = [];
    recommendAuthor = recommend;
    update();
  }

  //分页获取数据
  getMore() async {
    print("获取更多");
    await Future.delayed(Duration(seconds: 1));
    page++;
    List recommend1 = [
      {
        "id": page,
        "author": "华仔测评",
        "avatar":
            "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg",
        "describe": "笔记·158 |推荐自数码科技",
        "works": [
          {
            "describe": "手机照片定位测试机",
            "covers":
                "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
          },
          {
            "describe": "手机照片定位测试机",
            "covers":
                "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
          },
          {
            "describe": "手机照片定位测试机",
            "covers":
                "https://img01.jituwang.com/170722/256853-1FH2102K755.jpg",
          },
        ]
      },
    ];

    recommendAuthor.addAll(recommend1);
    update();
  }
}
