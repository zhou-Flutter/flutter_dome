/*
 * @Author: zxj
 * @Date: 2021-06-27 09:46:22
 * @LastEditTime: 2021-06-27 17:41:20
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transparent_image/transparent_image.dart';

class MainContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "附近的人的日常",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                // width: ScreenUtil().setWidth(750),

                height: ScreenUtil().setHeight(370),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _item(),
                    _item(),
                    _item(),
                    _item(),
                    _item(),
                    _item(),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "打开日常",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                // width: ScreenUtil().setWidth(750),

                height: ScreenUtil().setHeight(370),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _item(),
                    _item(),
                    _item(),
                    _item(),
                    _item(),
                    _item(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _item() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            height: ScreenUtil().setHeight(350),
            width: ScreenUtil().setWidth(210),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                fit: BoxFit.cover,
                image:
                    "https://img01.jituwang.com/190520/256575-1Z52011051093.jpg",
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(right: 5, left: 5, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.white,
                    size: 12,
                  ),
                  Text(
                    "9.4Km",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(60),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
                    ),
                  ),
                  Container(
                    child: Text(
                      "CURRY",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
