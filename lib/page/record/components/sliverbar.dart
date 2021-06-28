/*
 * @Author: zxj
 * @Date: 2021-06-27 09:35:17
 * @LastEditTime: 2021-06-27 09:36:17
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sliverbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.black,
          width: ScreenUtil().setWidth(750),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("images/hey_ic_camera_mode.png"),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "拍摄",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("images/hey_ic_clockin_mode.png"),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "打卡",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("images/hey_ic_daily_mode.png"),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "日记",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("images/hey_ic_text_mode.png"),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "文字",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset("images/hey_ic_voice_mode.png"),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "语音",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
