/*
 * @Author: zxj
 * @Date: 2021-06-02 10:54:07
 * @LastEditTime: 2021-06-02 10:55:26
 * @Description: 
 */
import 'package:get/get.dart';

import 'find_logic.dart';

class FindState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindLogic>(() => FindLogic());
  }
}
