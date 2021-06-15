import 'package:a_red_book/page/index/index_logic.dart';
import 'package:get/get.dart';

/// @description:
/// @author
/// @date: 2021/06/01 11:32:32
class IndexState implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexLogic>(() => IndexLogic());
  }
}
