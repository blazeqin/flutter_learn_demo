import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/pages/NewsDetailPage1.dart';

class SlideView extends StatefulWidget{

  var data;//轮播数据
  SlideView(data){
    this.data = data;
  }

  @override
  State<StatefulWidget> createState() => SlideViewState(data);
}

class SlideViewState extends State<SlideView> with SingleTickerProviderStateMixin {
  //内置的TabBarView组件
  TabController tabController;
  var slideData;
  SlideViewState(data){
    slideData = data;
  }

  @override
  void initState() {
    super.initState();
    //vsync??
    tabController = TabController(length: slideData == null? 0:slideData.length, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if(slideData!=null && slideData.length>0) {
      for(var i=0; i<slideData.length; i++) {
        var itemData = slideData[i];
        items.add(GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return NewsDetailPage(url: itemData['detailUrl'],);//itemData["detailUrl"]
            }));
          },
          child: Stack(// Stack组件用于将资讯标题文本放置到图片上面

              children: <Widget>[
                Image.network(itemData["imgUrl"]),
                Container(
                  //标题容器宽度跟屏幕宽度一致
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0x50000000),
                  child: Padding(padding: const EdgeInsets.all(7.0),
                      child: Text(itemData["title"], style: TextStyle(color: Colors.white, fontSize: 13.0),),
                  ),
                ),
              ],
          ),
        ));
      }
    }
    return TabBarView(children: items, controller: tabController,);
  }
}