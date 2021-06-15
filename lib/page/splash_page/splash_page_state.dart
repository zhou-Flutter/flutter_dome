/*
 * @Author: zxj
 * @Date: 2021-05-31 15:25:43
 * @LastEditTime: 2021-05-31 15:38:59
 * @Description: 
 */

import 'package:a_red_book/page/splash_page/splash_page_logic.dart';
import 'package:get/get.dart';

class SphpPageState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashPageLogic>(() => SplashPageLogic());
  }
}
