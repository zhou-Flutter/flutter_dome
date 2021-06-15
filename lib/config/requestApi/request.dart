/*
 * @Author: zxj
 * @Date: 2021-04-23 16:15:32
 * @LastEditTime: 2021-05-28 16:45:51
 * @Description: 
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'url.dart';

Future request(ur, {formData}) async {
  try {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    print("开始获取数据。。。");
    Response response;
    Dio dio = new Dio();
    Options options =
        Options(headers: {'content-type': 'application/x-www-form-urlencoded'});
    if (formData == null) {
      response = await dio.get(apiPath[ur]);
    } else {
      response = await dio.get(
        apiPath[ur],
        queryParameters: formData,
        options: options,
      );
    }
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      var list = json.decode(response.toString());
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
