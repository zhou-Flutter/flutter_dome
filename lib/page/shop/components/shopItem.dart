/*
 * @Author: zxj
 * @Date: 2021-06-15 16:56:56
 * @LastEditTime: 2021-06-15 16:59:37
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.red),
                color: Colors.white,
              ),
              child: Text("新人一元抢购"),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Text("提前强会场"),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Text("爆款分期免息"),
            ),
          ),
        ],
      ),
    );
  }
}
