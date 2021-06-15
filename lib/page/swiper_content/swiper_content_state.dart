/*
 * @Author: zxj
 * @Date: 2021-06-09 11:16:36
 * @LastEditTime: 2021-06-09 11:25:10
 * @Description: 
 */

import 'package:a_red_book/page/swiper_content/swiper_content_logic.dart';
import 'package:get/get.dart';

class SwiperContentState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SwiperContentLogic>(() => SwiperContentLogic());
  }
}
