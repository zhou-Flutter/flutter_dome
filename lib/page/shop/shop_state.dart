/*
 * @Author: zxj
 * @Date: 2021-06-04 14:03:36
 * @LastEditTime: 2021-06-04 14:04:30
 * @Description: 
 */

import 'package:a_red_book/page/shop/shop_logic.dart';
import 'package:get/get.dart';

class ShopState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopLogic>(() => ShopLogic());
  }
}
