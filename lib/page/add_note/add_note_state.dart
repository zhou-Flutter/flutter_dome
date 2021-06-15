/*
 * @Author: zxj
 * @Date: 2021-06-11 09:31:31
 * @LastEditTime: 2021-06-11 09:32:53
 * @Description: 
 */

import 'package:a_red_book/page/add_note/add_note_logic.dart';
import 'package:get/get.dart';

class AddNoteState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNoteLogic>(() => AddNoteLogic());
  }
}
