/*
 * @Author: zxj
 * @Date: 2021-05-31 15:45:17
 * @LastEditTime: 2021-05-31 15:48:01
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  //第三方登录
  List loginlist = [
    {
      "id": 1,
      "type": "qq",
      "image": "images/login_icon_welcome_qq_v3.png",
    },
    {
      "id": 2,
      "type": "weixin",
      "image": "images/login_icon_welcome_weixin_v3.png",
    },
    {
      "id": 3,
      "type": "phone",
      "image": "images/login_icon_welcome_phone_v3.png",
    },
    {
      "id": 4,
      "type": "weibo",
      "image": "images/login_icon_welcome_weibo_v3.png",
    },
  ];

  @override
  void onReady() async {
    super.onReady();
  }

  //点击一键登录
  toLogin() {
    // 一键登录的逻辑

    //。。。

    //登录成功跳转
    Get.offNamed("/indexPage");
  }

  //第三方登录
  toLoginOther(type) {
    print(type);
    switch (type) {
      case "qq":
        print("qq登录");
        break;
      case "weixin":
        print("weixin登录");
        break;
      case "phone":
        print("phone登录");
        break;
      case "weibo":
        print("weibo登录");
        break;
      default:
    }
  }
}
