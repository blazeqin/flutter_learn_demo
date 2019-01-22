
import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget{

  static const double ICON_IMAGE_WIDTH = 30.0;
  static const double ICON_ARROW_WIDTH = 16.0;
  final titles = ["我的消息", "阅读记录", "我的博客", "我的问答", "我的活动", "我的团队", "邀请好友"];
  final imagePaths = [
    "images/ic_my_message.png",
    "images/ic_my_blog.png",
    "images/ic_my_blog.png",
    "images/ic_my_question.png",
    "images/ic_discover_pos.png",
    "images/ic_my_team.png",
    "images/ic_my_recommend.png"
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("my info page"),
    );
  }

}