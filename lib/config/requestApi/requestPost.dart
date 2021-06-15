/*
 * @Author: zxj
 * @Date: 2021-05-27 09:13:25
 * @LastEditTime: 2021-05-27 09:15:13
 * @Description: 适配服务端的POst请求
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'url.dart';

Future requestPost(ur, {formData}) async {
  try {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    print("开始获取数据。。。");
    Response response;
    Dio dio = new Dio();
    Options options =
        Options(headers: {'content-type': 'application/x-www-form-urlencoded'});

    response = await dio.post(
      apiPath[ur],
      data: formData,
      options: options,
    );

    if (response.statusCode == 200) {
      var list = json.decode(response.toString());
      EasyLoading.dismiss();
      return list;
    } else {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
        msg: "网络链接异常",
      );
    }
  } catch (e) {
    EasyLoading.dismiss();
    Fluttertoast.showToast(
      msg: "网络链接异常",
    );
  }
}
