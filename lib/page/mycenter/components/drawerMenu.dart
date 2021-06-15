/*
 * @Author: zxj
 * @Date: 2021-06-10 15:56:22
 * @LastEditTime: 2021-06-10 17:06:42
 * @Description: 
 */

import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List item = [
      {"id": "1", "name": "发现好友", "icon": Icons.person_add_alt, "toPage": ""}
    ];
    List item1 = [
      {"id": "1", "name": "我的草稿", "icon": Icons.credit_card, "toPage": ""},
      {"id": "1", "name": "创作中心", "icon": Icons.person_add_alt, "toPage": ""},
      {"id": "1", "name": "钱包", "icon": Icons.local_atm, "toPage": ""},
      {"id": "1", "name": "免流量", "icon": Icons.sim_card, "toPage": ""},
      {"id": "1", "name": "好物体验", "icon": Icons.redeem, "toPage": ""}
    ];
    List item2 = [
      {"id": "1", "name": "订单", "icon": Icons.list_alt, "toPage": ""},
      {"id": "1", "name": "购物车", "icon": Icons.shopping_cart, "toPage": ""},
      {"id": "1", "name": "卡卷", "icon": Icons.card_giftcard, "toPage": ""},
      {"id": "1", "name": "心愿单", "icon": Icons.eco, "toPage": ""},
      {"id": "1", "name": "小红书会员", "icon": Icons.view_compact, "toPage": ""}
    ];
    List item3 = [
      {"id": "1", "name": "社会公约", "icon": Icons.grass, "toPage": ""}
    ];
    return Drawer(
      elevation: 16,
      child: Container(
        padding: EdgeInsets.only(top: 60),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Column(
                children: item.map((e) {
                  return itemlist(e);
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Divider(
                height: 1,
              ),
            ),
            Container(
              child: Column(
                children: item1.map((e) {
                  return itemlist(e);
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Divider(
                height: 1,
              ),
            ),
            Container(
              child: Column(
                children: item2.map((e) {
                  return itemlist(e);
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Divider(
                height: 1,
              ),
            ),
            Container(
              child: Column(
                children: item3.map((e) {
                  return itemlist(e);
                }).toList(),
              ),
            ),
            Spacer(),
            _shezhi(),
          ],
        ),
      ),
    );
  }

  Widget itemlist(e) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 15,
        left: 22,
      ),
      child: Row(
        children: [
          Icon(
            e["icon"],
            color: Colors.black54,
            size: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "${e["name"]}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _shezhi() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0x0f000000),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                ),
                Text("设置")
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0x0f000000),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Icon(
                    Icons.support_agent,
                    color: Colors.black54,
                  ),
                ),
                Text("帮助与客服")
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0x0f000000),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Icon(
                    Icons.crop_free,
                    color: Colors.black54,
                  ),
                ),
                Text("扫一扫")
              ],
            ),
          )
        ],
      ),
    );
  }
}
