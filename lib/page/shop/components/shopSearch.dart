/*
 * @Author: zxj
 * @Date: 2021-06-15 16:53:30
 * @LastEditTime: 2021-06-15 16:54:14
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.post_add,
                  color: Colors.black54,
                  size: 23,
                ),
                Text(
                  "订单",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(500),
              padding: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
              margin: EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0x0f000000),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.black26,
                  ),
                  Text(
                    "大家都在搜，美妆天花板",
                    style: TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.black54,
                  size: 25,
                ),
                Text(
                  "更多",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
