/*
 * @Author: zxj
 * @Date: 2021-06-02 13:56:48
 * @LastEditTime: 2021-06-02 13:57:36
 * @Description: 
 */
import 'package:a_red_book/page/find/recommend/recommend_logic.dart';
import 'package:get/get.dart';

class RecommendState {
  @override
  void dependencies() {
    Get.lazyPut<RecommendLogic>(() => RecommendLogic());
  }
}
