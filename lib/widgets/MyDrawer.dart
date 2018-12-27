import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  static const COVER_LENGTH = 304.0;
  var rightArrowIcon = Image.asset(
    "images/ic_arrow_right.png",
    width: 30.0,
      height: 16.0,
  );
  // 菜单的文本
  List menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];
  // 菜单文本前面的图标
  List menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];
TextStyle menuStyle = TextStyle(fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: COVER_LENGTH),
      child: Material(
        elevation: 16.0,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff)
          ),
          child: ListView.builder(
            itemCount: menuTitles.length * 2 +1,
            itemBuilder: renderRow,
          ),
        ),
      ),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    //头部加列表
    if(index == 0) {
      return Container(
        width: COVER_LENGTH,
        height: COVER_LENGTH,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
        child: Image.asset(
          "images/cover_img.jpg",
          width: COVER_LENGTH,
          height: COVER_LENGTH,
        ),
      );
    }
    index -= 1;
    //奇数：添加分割线；偶数：添加item标题
    if(index.isOdd) return Divider();

    index = index ~/ 2;//取整
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Row(
          children: <Widget>[
            Image.asset(menuIcons[index],width: 25.0,height: 25.0,),
            Expanded(//占据剩余所有空间
              child: Text(menuTitles[index],style: menuStyle,),
            ),
            rightArrowIcon,
          ],
        ),
      ),
      onTap: (){
        print("click list item $index");
      },
    );
  }
}