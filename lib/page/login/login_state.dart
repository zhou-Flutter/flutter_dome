/*
 * @Author: zxj
 * @Date: 2021-05-31 15:45:17
 * @LastEditTime: 2021-06-01 11:35:35
 * @Description: 
 */

import 'package:get/get.dart';

import 'login_logic.dart';

class LoginState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginLogic>(() => LoginLogic());
  }
}
