
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
    return ListView.builder(
      itemCount: titles.length * 2 + 1,
      itemBuilder: (context, i) => renderRow(context, i),
    );
  }

  renderRow(BuildContext context, int position) {
    if(position == 0) {//header
      return InkWell(
        child: Container(
          color: Colors.green[700],
          height: 180.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("images/ic_img_default.jpg"),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: Text("点击头像登录",style: TextStyle(color: Colors.white),),),
            ],
          ),
        ),
        onTap: (){
          print('clicked head...');
        },
      );
    }
    if(position.isOdd) {
      return Divider(height: 1.0,);
    }
    position = position ~/ 2;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 17.0, 10.0, 17.0),
        child: Row(
          children: <Widget>[
            Image.asset(imagePaths[position-1],width: ICON_IMAGE_WIDTH,height: ICON_IMAGE_WIDTH,),
            Expanded(
              child: Text(titles[position-1]),
            ),
            Image.asset('images/ic_arrow_right.png',
              width: ICON_ARROW_WIDTH,
              height: ICON_ARROW_WIDTH,),
          ],
        ),
      ),
      onTap: (){
        print('clicked $position');
      },
    );
  }

}