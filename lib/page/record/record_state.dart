/*
 * @Author: zxj
 * @Date: 2021-06-26 13:11:48
 * @LastEditTime: 2021-06-26 13:16:41
 * @Description: 
 */

import 'package:a_red_book/page/record/record_logic.dart';
import 'package:get/get.dart';

class RecordState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordLogic>(() => RecordLogic());
  }
}
