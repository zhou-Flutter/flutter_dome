/*
 * @Author: zxj
 * @Date: 2021-06-04 14:08:56
 * @LastEditTime: 2021-06-04 14:09:54
 * @Description: 
 */
import 'package:a_red_book/page/news/news_logic.dart';
import 'package:get/get.dart';

class NewsState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsLogic>(() => NewsLogic());
  }
}
