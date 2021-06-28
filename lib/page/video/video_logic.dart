/*
 * @Author: zxj
 * @Date: 2021-06-06 11:00:18
 * @LastEditTime: 2021-06-26 11:45:14
 * @Description: 
 */
import 'package:get/get.dart';

import 'video_state.dart';

class VideoLogic extends GetxController {
  bool commentbutton = false;
  @override
  void onReady() async {
    super.onReady();
  }

  getdt(v) {
    print(v);
  }

  //控制评论发送按钮
  controlCommentbutton(value) {
    print(value);
    if (value == null || value == "") {
      commentbutton = false;
    } else {
      commentbutton = true;
    }
    update();
  }
}
