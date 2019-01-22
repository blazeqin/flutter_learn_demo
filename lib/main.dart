import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_demo/pages/NewsListPage.dart';
import 'package:flutter_learn_demo/pages/TweetsListPage.dart';
import 'package:flutter_learn_demo/pages/DiscoveryPage.dart';
import 'package:flutter_learn_demo/pages/MyInfoPage.dart';
import 'package:flutter_learn_demo/widgets/MyDrawer.dart';

void main() => runApp(MyApp());

//statefull 和 stateless的区别
//底部tab状态点击会发生改变
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  var _tabIndex = 0;
  var _body;
  var tabImages;//bottom tab icon
  var appBarTitles = ['资讯','动弹','发现','我的'];
  final tabTextStyleSelected = TextStyle(color: Colors.green[700]);
  final tabTextStyleNormal = TextStyle(color: Colors.grey);
  void initData(){
    if(tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
    _body = IndexedStack(//仅展示list中的一个view
      children: <Widget>[
        NewsListPage(),
        TweetsListPage(),
        DiscoveryPage(),
        MyInfoPage(),
      ],
      index: _tabIndex,
    );
  }


  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      title: "My App",
      theme: ThemeData(
        //MaterialColor primarySwatch, Color primaryColor
        primaryColor: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("${appBarTitles[_tabIndex]}",
            style: TextStyle(color: Colors.white),),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          items: getBottomNavItems(),
        currentIndex: _tabIndex,
        onTap: (index){
            setState(() {
              _tabIndex = index;
            });
        },),
        drawer: Drawer(
          child: Center(
            child: MyDrawer(),
          ),
        ),
      ),
    );
  }

  //get bottom tab: icon and text
  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = new List();
    for(int i=0; i < 4; i++) {
      list.add(BottomNavigationBarItem(
          icon: getTabIcon(i),
        title: getTabTitle(i)
      ));
    }
    return list;
  }

  Image getTabIcon(int curIndex) {
    if(curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return Text(
      appBarTitles[curIndex],
      style: getTabTextStyle(curIndex),
    );
  }

  Image getTabImage(String localPath) {
    return Image.asset(localPath,width: 20.0, height: 20.0,);
  }

  TextStyle getTabTextStyle(int curIndex) {
    if(curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

}