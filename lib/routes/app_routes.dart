/*
 * @Author: zxj
 * @Date: 2021-05-31 15:41:00
 * @LastEditTime: 2021-06-26 13:17:29
 * @Description: 路由配置
 */
part of './app_pages.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const SplashPagePage = '/SplashPagePage'; //启动页面
  static const loginPage = '/loginPage'; //登陆页面
  static const indexPage = '/indexPage'; //配置底部导航栏页面
  static const findPage = '/findPage'; //首页发现页面
  static const shopPage = '/shopPage'; //商城
  static const newsPage = '/newsPage'; //消息

  static const mycenterPage = '/mycenterPage'; //我的中心
  static const videoPage = '/videoPage'; //视频页面

  static const swiperContentPage = '/swiperContentPage'; //轮播图内容页面

  static const addNotePage = '/addNotePage'; //添加笔记页面

  static const recordPage = '/recordPage'; //记录自己的日常页面

}
