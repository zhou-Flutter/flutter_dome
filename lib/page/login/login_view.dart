/*
 * @Author: zxj
 * @Date: 2021-05-31 15:45:17
 * @LastEditTime: 2021-06-05 10:56:22
 * @Description:  登录页UI
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'login_logic.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final LoginLogic logic = Get.put(LoginLogic());
VideoPlayerController _controller;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('images/b2.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginLogic>(
        builder: (logic) => Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: ScreenUtil().setHeight(1335),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Column(
                children: [
                  login(),
                  loginOther(logic.loginlist),
                  xieyi(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //一键登录
  Widget login() {
    return Column(
      children: [
        //电话号码
        Text(
          "+86 15346983027",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(35),
            color: Colors.white,
          ),
        ),
        //登录按钮
        Container(
          margin: EdgeInsets.only(top: 10),
          width: ScreenUtil().setHeight(500),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all(
                  StadiumBorder(side: BorderSide(color: Colors.black12))),
            ),
            child: Text(
              "同意协议并一点登录",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              logic.toLogin();
            },
          ),
        ),
      ],
    );
  }

  Widget loginOther(item) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: ScreenUtil().setHeight(550),
      child: Row(
        children: item.map<Widget>(
          (e) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  logic.toLoginOther(e["type"]);
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  child: Image.asset(e["image"]),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget xieyi() {
    return Container(
      width: ScreenUtil().setHeight(500),
      margin: EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          children: [
            Text(
              "登录注册代表同意《用户协议》《隐私政策》《儿童/青少年个人信息保护规程》《中国电信服务条款》",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white70, fontSize: ScreenUtil().setSp(18)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
