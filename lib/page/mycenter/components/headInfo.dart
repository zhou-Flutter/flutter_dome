/*
 * @Author: zxj
 * @Date: 2021-06-06 10:28:38
 * @LastEditTime: 2021-06-06 10:33:09
 * @Description:  个人资料头部信息
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Curry",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "小红书号：68464565",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: ScreenUtil().setSp(20)),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.self_improvement,
                          color: Colors.blue,
                          size: 18,
                        ),
                        Text(
                          "白羊座",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(20)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              "去编辑资料完善个人资料吧",
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(22)),
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          "1",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "关注",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "粉丝",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "获赞与收藏",
                          style: TextStyle(
                            color: Color(0xFFC5C8CE),
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding:
                    EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                      width: ScreenUtil().setWidth(1), color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Text(
                  "编辑资料",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(20)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding:
                    EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                      width: ScreenUtil().setWidth(1), color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
