/*
 * @Author: zxj
 * @Date: 2021-06-10 15:04:48
 * @LastEditTime: 2021-06-10 15:05:48
 * @Description: 
 */

import 'package:a_red_book/page/follow/follow_logic.dart';
import 'package:get/get.dart';

class FollowState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowLogic>(() => FollowLogic());
  }
}
