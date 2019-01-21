
import 'package:flutter/material.dart';

class TweetsListPage extends StatelessWidget{
  var screenWidth;
  var normalTweetsList = [];
  var hotTweetsList = [];
  TextStyle authorTextStyle;
  TextStyle subtitleStyle;

  TweetsListPage(){
    authorTextStyle = TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold);
    subtitleStyle = TextStyle(fontSize: 12.0, color: const Color(0xffb5bdc0));

    // 添加测试数据
    for (int i = 0; i < 20; i++) {
      Map<String, dynamic> map = new Map();
      // 动弹发布时间
      map['pubDate'] = '2018-7-30';
      // 动弹文字内容
      map['body'] = '早上七点十分起床，四十出门，花二十多分钟到公司，必须在八点半之前打卡；下午一点上班到六点，然后加班两个小时；八点左右离开公司，呼呼登自行车到健身房锻炼一个多小时。到家已经十点多，然后准备第二天的午饭，接着收拾厨房，然后洗澡，吹头发，等能坐下来吹头发时已经快十二点了。感觉很累。';
      // 动弹作者昵称
      map['author'] = '红薯';
      // 动弹评论数
      map['commentCount'] = 10;
      // 动弹作者头像URL
      map['portrait'] = 'https://static.oschina.net/uploads/user/0/12_50.jpg?t=1421200584000';
      // 动弹中的图片，多张图片用英文逗号隔开
      map['imgSmall'] = 'https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg,https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg,https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg,https://b-ssl.duitang.com/uploads/item/201508/27/20150827135810_hGjQ8.thumb.700_0.jpeg';
      hotTweetsList.add(map);
      normalTweetsList.add(map);
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(tabs: <Widget>[
            Tab(text: "List",),
            Tab(text: "Hot",)
          ]),
          body: TabBarView(
            children: <Widget>[
              getNormalListView(),getHotListView(),
            ],
          ),
        )
    );
  }

  //hot list
  Widget getHotListView() {
    return ListView.builder(itemBuilder: (context,i)=>renderHotRow(i),
    itemCount: hotTweetsList.length *2 - 1,);
  }

  // normal list
  Widget getNormalListView() {
    return ListView.builder(
      itemCount: normalTweetsList.length*2 - 1,
        itemBuilder: (context, i)=>renderNormalRow(i)
    );
  }

  renderNormalRow(int i) {
    if(i.isOdd) {
      return Divider(height: 1.0,);
    }else{
      i = i~/2;
      return getRowWidget(normalTweetsList[i]);
    }

  }

  Widget getRowWidget(Map<String, dynamic> listItem) {
    var authorRow = Row(
      children: <Widget>[
        Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            image: DecorationImage(
              image: NetworkImage(listItem['portrait']),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(6.0, 0, 0, 0),
          child: Text(
            listItem['author'],
            style: authorTextStyle,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('${listItem['commentCount']}',style: subtitleStyle,),
              Image.asset("./image/ic_comment.png", width: 16.0, height: 16.0,)
            ],
          ),
        )
      ],
    );
//    var contentRow

    var columns = <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 2.0),
        child: authorRow,
      ),
      Padding(padding: const EdgeInsets.fromLTRB(52.0, 0, 10.0, 0),
        child: Text(listItem['body']),
      )
    ];

    //third column
    String imgSmall = listItem['imgSmall'];
    if(imgSmall != null && imgSmall.length > 0) {
      var list = imgSmall.split(",");
      List<String> imgUrlList = List<String>();
      for(String s in list){
        if(s.startsWith("http"))
          imgUrlList.add(s);
        else
          imgUrlList.add("https://static.oschina.net/uploads/space/" + s);
      }
      List<Widget> imgList = [];
      List<List<Widget>> rows = [];
      double cellWidth = (screenWidth - 100)/3;
      for(var row=0; row< getRow(imgUrlList.length);row++) {
        List<Widget> rowArr = [];
        for(var col=0;col<3; col++) {
          num index = row*3 + col;
          if(index < imgUrlList.length) {
            rowArr.add(Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(imgUrlList[index],width: cellWidth,height: cellWidth,),
            ));
          }
        }
        rows.add(rowArr);
      }
      for(var row in rows) {
        imgList.add(Row(
          children: row,
        ));
      }
      columns.add(Padding(
        padding: const EdgeInsets.fromLTRB(52.0, 5.0, 10.0, 0),
        child: Column(children: imgList,),
      ));
    }

    //fourth column

    return InkWell(
      child: Column(
        children: columns,
      ),
      onTap: (){},
    );
  }

  //get image row
  int getRow(int i) {
    int a = i % 3;
    int b = i ~/ 3;
    if(a != 0) return b+1;
    return b;
  }

  renderHotRow(int i) {
    if(i.isOdd) {
      return Divider(height: 1.0,);
    }else{
      i = i ~/ 2;
      return getRowWidget(hotTweetsList[i]);
    }

  }

}