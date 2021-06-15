/*
 * @Author: zxj
 * @Date: 2021-06-02 13:56:48
 * @LastEditTime: 2021-06-09 11:27:55
 * @Description: 
 */
import 'package:a_red_book/config/data/recommendList.dart';
import 'package:get/get.dart';

import 'recommend_state.dart';

class RecommendLogic extends GetxController {
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

  //跳转到视频页面
  tocontentPage(value) {
    if (value == true) {
      Get.toNamed("/videoPage");
    } else {
      Get.toNamed("/swiperContentPage");
    }
  }
}
