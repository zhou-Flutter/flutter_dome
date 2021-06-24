/*
 * @Author: zxj
 * @Date: 2021-06-04 14:03:36
 * @LastEditTime: 2021-06-04 14:04:38
 * @Description: 
 */
import 'package:a_red_book/config/data/recommendList.dart';
import 'package:get/get.dart';

import 'shop_state.dart';

class ShopLogic extends GetxController {
  List recommendList = [];
  @override
  void onReady() async {
    super.onReady();
    //获取推荐页的数据
    getRecommendList();
    print("推荐页");
  }

  //模拟网络获取数据
  getRecommendList() async {
    await Future.delayed(Duration(seconds: 1));
    recommendList = listitem;
    update();
  }
}
