/*
 * @Author: zxj
 * @Date: 2021-06-04 14:15:44
 * @LastEditTime: 2021-06-04 14:16:51
 * @Description: 
 */
import 'package:a_red_book/page/mycenter/mycenter_logic.dart';
import 'package:get/get.dart';

class MycenterState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MycenterLogic>(() => MycenterLogic());
  }
}
