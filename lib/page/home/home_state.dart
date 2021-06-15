/*
 * @Author: zxj
 * @Date: 2021-06-01 15:53:02
 * @LastEditTime: 2021-06-01 15:57:31
 * @Description: 
 */

import 'package:a_red_book/page/home/home_logic.dart';
import 'package:get/get.dart';

class HomeState {
  @override
  void dependencies() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }
}
