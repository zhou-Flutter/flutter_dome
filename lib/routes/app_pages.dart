/*
 * @Author: zxj
 * @Date: 2021-05-31 15:41:00
 * @LastEditTime: 2021-06-26 13:44:51
 * @Description: 路由管理
 */
import 'package:a_red_book/page/add_note/add_note_state.dart';
import 'package:a_red_book/page/add_note/add_note_view.dart';
import 'package:a_red_book/page/find/find_state.dart';
import 'package:a_red_book/page/find/find_view.dart';
import 'package:a_red_book/page/index/index_state.dart';
import 'package:a_red_book/page/index/index_view.dart';
import 'package:a_red_book/page/login/login_state.dart';
import 'package:a_red_book/page/login/login_view.dart';
import 'package:a_red_book/page/mycenter/mycenter_state.dart';
import 'package:a_red_book/page/mycenter/mycenter_view.dart';
import 'package:a_red_book/page/news/news_state.dart';
import 'package:a_red_book/page/news/news_view.dart';
import 'package:a_red_book/page/record/record_state.dart';
import 'package:a_red_book/page/record/record_view.dart';
import 'package:a_red_book/page/shop/shop_state.dart';
import 'package:a_red_book/page/shop/shop_view.dart';
import 'package:a_red_book/page/splash_page/splash_page_state.dart';
import 'package:a_red_book/page/splash_page/splash_page_view.dart';
import 'package:a_red_book/page/swiper_content/swiper_content_state.dart';
import 'package:a_red_book/page/swiper_content/swiper_content_view.dart';
import 'package:a_red_book/page/video/video_state.dart';
import 'package:a_red_book/page/video/video_view.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SplashPagePage,
      page: () => SplashPagePage(),
      binding: SphpPageState(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
      binding: LoginState(),
    ),
    GetPage(
      name: Routes.indexPage,
      page: () => IndexPage(),
      binding: IndexState(),
    ),
    GetPage(
      name: Routes.findPage,
      page: () => FindPage(),
      binding: FindState(),
    ),
    GetPage(
      name: Routes.shopPage,
      page: () => ShopPage(),
      binding: ShopState(),
    ),
    GetPage(
      name: Routes.newsPage,
      page: () => NewsPage(),
      binding: NewsState(),
    ),
    GetPage(
      name: Routes.mycenterPage,
      page: () => MycenterPage(),
      binding: MycenterState(),
    ),
    GetPage(
      name: Routes.videoPage,
      page: () => VideoPage(),
      binding: VideoState(),
    ),
    GetPage(
      name: Routes.swiperContentPage,
      page: () => SwiperContentPage(),
      binding: SwiperContentState(),
    ),
    GetPage(
      name: Routes.addNotePage,
      page: () => AddNotePage(),
      binding: AddNoteState(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.recordPage,
      page: () => RecordPage(),
      binding: RecordState(),
      transition: Transition.leftToRight,
    ),
  ];
}
