/*
 * @Author: zxj
 * @Date: 2021-06-06 11:00:18
 * @LastEditTime: 2021-06-06 11:40:50
 * @Description: 
 */
import 'package:a_red_book/page/video/video_logic.dart';
import 'package:get/get.dart';

class VideoState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoLogic>(() => VideoLogic());
  }
}
