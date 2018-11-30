import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: ADemoPage(title: 'Flutter Demo Show Page'),
    );
  }
}

class ADemoPage extends StatefulWidget {
  final String title;
  //A new widget will only be used to update an existing element if its key is the same as the key of the current widget associated with the element.
  ADemoPage({this.title, Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() => ADemoPageState();
}

class ADemoPageState extends State<ADemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          //图片的圆角有多种实现方式，如下是一种，还可以使用shape
          Container(
            width: 500.0,
            height: 150.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage("images/lake.jpg"),
                fit: BoxFit.cover,//same to scaleType
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
          ),
          _TitleSelection(title:"Oeschinen Lake Campground",subTitle:"Kandersteg, Switzerland",starCount:11),
          Row(
            //沿水平方向平均放置
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButtonColumn(context, Icons.call, "CALL"),
              _buildButtonColumn(context, Icons.near_me, "ROUTE"),
              _buildButtonColumn(context, Icons.share, "SHARE"),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text("Lake Oeschinen lies at the foot of the bluemlisalp in the "
                "Bernese Alps. Situated 1,578 meters above sea level, it is "
                "one of the larger Alpine Lakes. A gondola ride from Kandersteg, "
                "followed by a half-hour walk through pastures and pine forest, "
                "leads you to the lake, which warms to 20 degrees Celsius in the "
                "summer. Acitivities enjoyed here include rowing, and riding the summer toHoggan run."),
          )
        ],
      ),
    );
  }
}

class _TitleSelection extends StatelessWidget{
  final String title;
  final String subTitle;
  final int starCount;
  _TitleSelection({this.title,this.subTitle,this.starCount,Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Column(
              //水平方向的对齐，在text里设置达不到效果，默认是居中的
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
//                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
                Icons.grade,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              starCount.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

}

Widget _buildButtonColumn(BuildContext context,IconData icon, String label){
  final color = Theme.of(context).primaryColor;
  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。    
    //  在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用    
    //  free space；类似于 Android 的 wrap_content。    
    //  对应的，还有 MainAxisSize.max    
    mainAxisSize: MainAxisSize.min,
    //  沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: color,),
      Container(
        margin: EdgeInsets.only(top: 7.0),
        child: Text(label,style: TextStyle(color: color, fontSize: 13.0,),),
      ),
    ],
  );
}
