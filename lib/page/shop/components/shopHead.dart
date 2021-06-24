/*
 * @Author: zxj
 * @Date: 2021-06-15 16:55:20
 * @LastEditTime: 2021-06-15 16:56:03
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(220),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("心动红包"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(220),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("小清单"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("大咖直播间"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("提前强会场"),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: ScreenUtil().setHeight(200),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text("爆款分期免息"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
