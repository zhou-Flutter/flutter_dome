/*
 * @Author: zxj
 * @Date: 2021-06-27 18:14:24
 * @LastEditTime: 2021-06-27 18:22:26
 * @Description: 
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:transparent_image/transparent_image.dart';

class NoteItem extends StatelessWidget {
  Map item;
  Function onTap;
  NoteItem({this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(367),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: ScreenUtil().setHeight(item["imgHight"]),
                    width: ScreenUtil().setWidth(item["imgWidth"]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover,
                        image: item["coverImg"],
                      ),
                    ),
                  ),
                  item["ismp4"] != true
                      ? Text("")
                      : Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black26,
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                item["name"],
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    height: ScreenUtil().setHeight(40),
                    width: ScreenUtil().setWidth(40),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
                    ),
                  ),
                  Text(
                    "${item["write"]}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                  Spacer(),
                  LikeButton(
                    likeCount: int.parse(item["like"]),
                    likeCountPadding: EdgeInsets.only(left: 0),
                    likeBuilder: (bool) {
                      if (bool) {
                        return Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 22,
                        );
                      } else {
                        return Icon(
                          Icons.favorite_border,
                          color: Colors.black26,
                          size: 22,
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
