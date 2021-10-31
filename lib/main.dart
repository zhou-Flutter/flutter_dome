/*
 * @Author: zxj
 * @Date: 2021-05-31 13:41:44
 * @LastEditTime: 2021-06-24 10:59:52
 * @Description: 
 */
/*
 *                        _oo0oo_
 *                       o8888888o
 *                       88" . "88
 *                       (| -_- |)
 *                       0\  =  /0
 *                     ___/`---'\___
 *                   .' \\|     |// '.
 *                  / \\|||  :  |||// \
 *                 / _||||| -:- |||||- \
 *                |   | \\\  - /// |   |
 *                | \_|  ''\---/''  |_/ |
 *                \  .-\__  '-'  ___/-. /
 *              ___'. .'  /--.--\  `. .'___
 *           ."" '<  `.___\_<|>_/___.' >' "".
 *          | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *          \  \ `_.   \_ __\ /__ _/   .-` /  /
 *      =====`-.____`.___ \_____/___.-`___.-'=====
 *                        `=---='
 * 
 * 
 *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 
 *            佛祖保佑                  永无BUG
 */

import 'dart:async';

import 'package:a_red_book/page/splash_page/splash_page_state.dart';
import 'package:a_red_book/page/splash_page/splash_page_view.dart';
import 'package:a_red_book/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  //测试提交
  WidgetsFlutterBinding.ensureInitialized();

  //捕捉flutter异常
  FlutterError.onError = flutterErrorDeetail;

  // 处理dart异常
  runZonedGuarded(() async {
    runApp(ARedBook());
  }, (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

flutterErrorDeetail(FlutterErrorDetails details) async {
  Zone.current.handleUncaughtError(details.exception, details.stack);
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print("Flutter端捕获端异常:$error,  异常内容： $stackTrace");
}

class ARedBook extends StatefulWidget {
  @override
  _ARedBookState createState() => _ARedBookState();
}

class _ARedBookState extends State<ARedBook> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => Container(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          builder: EasyLoading.init(),
          defaultTransition: Transition.rightToLeft,
          initialBinding: SphpPageState(),
          getPages: AppPages.pages,
          home: SplashPagePage(),
        ),
      ),
    );
  }
}
