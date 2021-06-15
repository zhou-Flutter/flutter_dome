/*
 * @Author: zxj
 * @Date: 2021-05-31 15:25:43
 * @LastEditTime: 2021-06-01 11:35:43
 * @Description:  启动页面控制层
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_page_state.dart';

class SplashPageLogic extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    showUserAgreement();
  }

  //弹出用户协议
  showUserAgreement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('Agreement') == null) {
      //弹出用户协议
      Get.defaultDialog(
        title: "温馨提示",
        titleStyle: TextStyle(fontSize: ScreenUtil().setSp(50)),
        radius: 5,
        barrierDismissible: false,
        content: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "欢迎来到小红书!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: ScreenUtil().setHeight(350),
                width: ScreenUtil().setWidth(700),
                child: ListView(
                  children: [
                    Text(
                      "1.为给您提供发布服务，我们可能会申请手机存储权限、摄像头权限、麦克风权限；",
                      style: TextStyle(
                          height: 1.4, fontSize: ScreenUtil().setSp(23)),
                    ),
                    Text(
                      "2.为了基于您所在的位置向您推荐内容，我们可能会申请您的位置权限；",
                      style: TextStyle(
                          height: 1.4, fontSize: ScreenUtil().setSp(23)),
                    ),
                    Text(
                      "3.为了信息推送和账号安全，我们会申请系统设备权限收集设备信息、日志信息；",
                      style: TextStyle(
                          height: 1.4, fontSize: ScreenUtil().setSp(23)),
                    ),
                    Text(
                      "4.为了帮助您发现更多好友，我们可能会申请通讯录权限；",
                      style: TextStyle(
                          height: 1.4, fontSize: ScreenUtil().setSp(23)),
                    ),
                    Text(
                      "5.我们会努力采取各种安全技术保护您的个人信息，未经您同意，我们不会从第三方获取、共享或对外提供您的信息；",
                      style: TextStyle(
                          height: 1.4, fontSize: ScreenUtil().setSp(23)),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Center(
                  child: Text(
                    "你可以阅读完整版用户协议和隐私政策",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        cancel: Container(
          width: ScreenUtil().setWidth(200),
          child: OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  StadiumBorder(side: BorderSide(color: Colors.white))),
            ),
            child: Text(
              "不同意",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              //取消按钮
            },
          ),
        ),
        confirm: Container(
          width: ScreenUtil().setWidth(200),
          child: ElevatedButton(
            clipBehavior: Clip.antiAlias,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all(
                  StadiumBorder(side: BorderSide(color: Colors.black12))),
            ),
            child: Text(
              "同意",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Get.back();
              prefs.setInt('Agreement', 1);
              //判断是否登录
              isLogin();
            },
          ),
        ),
      );
    } else {
      //判断是否登录
      isLogin();
    }
  }

  isLogin() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString("userName");
    if (username == null) {
      //跳转登录页面
      Get.offNamed("/loginPage");
    } else {
      //跳转到首页

    }
  }
}
