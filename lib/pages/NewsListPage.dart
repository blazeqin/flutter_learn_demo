import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/pages/NewsDetailPage1.dart';
import 'package:flutter_learn_demo/widgets/SlideView.dart';

class NewsListPage extends StatelessWidget {
  var slideData; //banner
  var listData; // list item data
  var titleTextStyle = TextStyle(fontSize: 15.0);
  var subtitleStyle = TextStyle(color: Color(0xffb5bdc0), fontSize: 12.0);

  NewsListPage() {
    slideData = [];
    listData = [];
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "news",
//          style: TextStyle(color: Colors.white),
//        ),
//        centerTitle: true,
//        iconTheme: IconThemeData(color: Colors.white),
//      ),
      body: ListView.builder(
        itemBuilder: renderRow,
        itemCount: listData.length * 2 + 1,
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("news list..bla bla"),
//            RaisedButton(
//              child: Text("Back"),
//              onPressed: (){
////                Navigator.of(context).pop();//点击之后黑屏。。。
//                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
//                    return NewsDetailPage1();
//                  }));
//              },
//            )
//          ],
//        ),
//      ),
    );
  }

  void initData() {
    // 这里做数据初始化，加入一些测试数据
    for (int i = 0; i < 3; i++) {
      Map map = new Map();
      // 轮播图的资讯标题
      map['title'] = 'Python 之父透露退位隐情，与核心开发团队产生隔阂';
      // 轮播图的详情URL
      map['detailUrl'] =
          'https://www.oschina.net/news/98455/guido-van-rossum-resigns';
      // 轮播图的图片URL
      map['imgUrl'] =
          'https://static.oschina.net/uploads/img/201807/30113144_1SRR.png';
      slideData.add(map);
    }
    for (int i = 0; i < 30; i++) {
      Map map = new Map();
      // 列表item的标题
      map['title'] = 'J2Cache 2.3.23 发布，支持 memcached 二级缓存';
      // 列表item的作者头像URL
      map['authorImg'] =
          'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
      // 列表item的时间文本
      map['timeStr'] = '2018/7/30';
      // 列表item的资讯图片
      map['thumb'] =
          'https://static.oschina.net/uploads/logo/j2cache_N3NcX.png';
      // 列表item的评论数
      map['commCount'] = 5;
      listData.add(map);
    }
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      //banner
      return Container(
        height: 180.0,
        child: SlideView(slideData),
      );
    }
    index -= 1;
    if (index.isOdd) return Divider();
    index = index ~/ 2;
    var itemData = listData[index];
    //单独使用expanded会报错，但日志错误不明显，页面显示空白
    var titleText = Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
      child: Text(
        itemData["title"],
        style: titleTextStyle,
      ),
    );
    var timeRow = Row(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
          // header
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffececec),
            image: DecorationImage(
              image: NetworkImage(itemData["authorImg"]),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: const Color(0xffececec),
              width: 2.0,
            ),
          ),
        ),
        Expanded(
          //date text
          child: Text(
            itemData["timeStr"],
            style: subtitleStyle,
          ),
        ),
        Text(
          "${itemData["commCount"]}",
          style: subtitleStyle,
        ),
        Image.asset(
          "./images/ic_comment.png",
          width: 16.0,
          height: 16.0,
        )
      ],
    );
    var thumbImg =
        getImageWidget(ExactAssetImage("./images/ic_img_default.jpg"));
    if (itemData["thumb"] != null && itemData["thumb"].length > 0) {
      thumbImg = getImageWidget(NetworkImage(itemData["thumb"]));
    }
    var row = Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              titleText,
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: timeRow,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
            width: 100.0,
            height: 80.0,
            color: const Color(0xffececec),
            child: Center(
              child: thumbImg,
            ),
          ),
        )
      ],
    );
    return InkWell(
      child: row,
      onTap: (){
        print("tap ...$index");
      },
    );
  }

  Widget getImageWidget(ImageProvider imageWidget) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xffececec),
        image: DecorationImage(
          image: imageWidget,
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: const Color(0xffececec),
          width: 2.0,
        ),
      ),
    );
  }
}
