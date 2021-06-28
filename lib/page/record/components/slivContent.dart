/*
 * @Author: zxj
 * @Date: 2021-06-27 09:37:38
 * @LastEditTime: 2021-06-27 09:38:21
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlivContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: ScreenUtil().setHeight(420),
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child:
                        Image.asset("images/hey_guide_card_daily_emotion.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Image.asset("images/hey_guide_card_voice.png"),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Image.asset("images/hey_guide_card_clockin.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Image.asset("images/hey_guide_card_shoot.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(3),
                    child: Image.asset("images/hey_guide_card_text.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
