import 'package:flutter/material.dart';

class DiscoveryPage extends StatelessWidget {
  static const String DIVIDER_FULL = "fullDivider";
  static const String DIVIDER_MISS = "missDivider";
  static const String DIVIDER_BLANK = "blankDivider";

  static const double ICON_IMAGE_WIDTH = 30.0;
  static const double ICON_ARROW_WIDTH = 16.0;

  final imagePaths = [
    "images/ic_discover_softwares.png",
    "images/ic_discover_git.png",
    "images/ic_discover_gist.png",
    "images/ic_discover_scan.png",
    "images/ic_discover_shake.png",
    "images/ic_discover_nearby.png",
    "images/ic_discover_pos.png",
  ];

  final titles = ["开源软件", "码云推荐", "代码片段", "扫一扫", "摇一摇", "码云封面人物", "线下活动"];
  final rightArrowIcon = Image.asset(
    'images/ic_arrow_right.png',
    width: ICON_ARROW_WIDTH,
    height: ICON_ARROW_WIDTH,
  );
  final titleTextStyle = TextStyle(fontSize: ICON_ARROW_WIDTH);
  List listData = [];

  DiscoveryPage(){
    listData.add(DIVIDER_FULL);
    for(var i=0; i<3; i++) {
      listData.add(ListItem(icon:imagePaths[i], title:titles[i]));
      if(i==2) {
        listData.add(DIVIDER_FULL);
      }else
        listData.add(DIVIDER_MISS);
    }
    listData.add(DIVIDER_BLANK);
    listData.add(DIVIDER_FULL);
    for(var i=3; i<5; i++) {
      listData.add(ListItem(title: titles[i],icon: imagePaths[i]));
      if(i==4)
        listData.add(DIVIDER_FULL);
      else
        listData.add(DIVIDER_MISS);
    }
    listData.add(DIVIDER_BLANK);
    listData.add(DIVIDER_FULL);
    for(var i=5; i<7; i++) {
      listData.add(ListItem(title: titles[i],icon: imagePaths[i]));
      if(i==6)
        listData.add(DIVIDER_FULL);
      else
        listData.add(DIVIDER_MISS);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
      child: ListView.builder(itemBuilder: (context, i)=> renderRow(context, i),
        itemCount: listData.length,
      ),
    );
  }

  renderRow(BuildContext context, int i) {
    var item = listData[i];
    if(item is String) {
      switch(item) {
        case DIVIDER_FULL:
          return Divider(height: 1.0,);
        case DIVIDER_MISS:
          return Padding(padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
          child: Divider(height: 1.0,),);
        case DIVIDER_BLANK:
          return Container(height: 20.0,);
      }
    }else if( item is ListItem) {
      return InkWell(
        onTap: (){

          print('clicked ${item.title}');
        },
        child: Padding(padding: const EdgeInsets.fromLTRB(10.0, 17.0, 10.0, 17.0),
        child: Row(
          children: <Widget>[
            getImageIcon(item.icon),
            Expanded(child: Text(item.title,style: titleTextStyle,)),
            rightArrowIcon,
          ],
        ),),
      );
    }
  }

  getImageIcon(String url) {
    return Image.asset(url,height: ICON_IMAGE_WIDTH,width: ICON_IMAGE_WIDTH,);
  }
}

class ListItem{
  String icon;
  String title;

  ListItem({this.icon, this.title});
}