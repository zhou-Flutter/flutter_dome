/*
 * @Author: zxj
 * @Date: 2021-05-31 15:25:43
 * @LastEditTime: 2021-06-25 10:44:25
 * @Description:  启动页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'splash_page_logic.dart';
import 'splash_page_state.dart';

class SplashPagePage extends StatelessWidget {
  final SplashPageLogic logic = Get.put(SplashPageLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(180),
            width: ScreenUtil().setWidth(380),
            margin: EdgeInsets.only(top: 200),
            child: Image.asset(
              "images/common_logo.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      )),
    );
  }
}
