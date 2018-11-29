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
            padding: const EdgeInsets.all(4.0),
            margin: const EdgeInsets.all(6.0),
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

