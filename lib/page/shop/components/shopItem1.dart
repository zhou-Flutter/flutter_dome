/*
 * @Author: zxj
 * @Date: 2021-06-15 16:58:19
 * @LastEditTime: 2021-06-15 16:58:28
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopItem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(500),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.red),
                color: Colors.white,
              ),
              child: Text("直播分享会"),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(240),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.red),
                    color: Colors.white,
                  ),
                  child: Text("data"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(240),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 1, color: Colors.red),
                    color: Colors.white,
                  ),
                  child: Text("data"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
