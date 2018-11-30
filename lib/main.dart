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
  ADemoPage({this.title, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ADemoPageState();
}

class ADemoPageState extends State<ADemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _toListPage),
        ],
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
                image: AssetImage("images/lake.jpg"),
                fit: BoxFit.cover, //same to scaleType
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
          ),
          _TitleSelection(
              title: "Oeschinen Lake Campground",
              subTitle: "Kandersteg, Switzerland",
              starCount: 11),
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
            child: Text(
                "Lake Oeschinen lies at the foot of the bluemlisalp in the "
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

  void _toListPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MaterialApp(
          title: "List show",
        theme: ThemeData(
          primaryColor: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("List Show"),
          ),
          body:ListView.builder(
            itemCount: _buildings.length,
            itemBuilder: (context, index){
              return _ItemView(index, _buildings[index]);
            },
          ),
        )
      );
    }));
  }
}

class _ItemView extends StatelessWidget{
  final position;
  final Building building;
  _ItemView(this.position, this.building);
  @override
  Widget build(BuildContext context) {
    final widget = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 14.0, right: 34.0),
          child:Icon(
            building.type == BuildingType.restaurant ? Icons.restaurant : Icons.theaters,
            color: Colors.blue[400],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(building.title,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14.0),),
              Text(building.address, style: TextStyle(color: Colors.grey[500]),),
            ],
          ),
        ),
      ],
    );
    //一般来说，为了监听手势事件，我们使用 GestureDetector。但这里为了在点击的时候有个
    //水波纹效果，使用的是 InkWell。
    return InkWell(
      onTap: ()=>listener(position),
      child: widget,
    );
  }

  listener(position) {
    print(_buildings[position].title);
  }
}

enum BuildingType { theater, restaurant }

class Building {
  final BuildingType type;
  final String title;
  final String address;

  Building(this.type, this.title, this.address);
}

final _buildings = [
  Building(BuildingType.theater, 'CineArtsattheEmpire', '85WPortalAve'),
  Building(BuildingType.theater, 'TheCastroTheater', '429CastroSt'),
  Building(BuildingType.theater, 'AlamoDrafthouseCinema', '2550MissionSt'),
  Building(BuildingType.theater, 'RoxieTheater', '311716thSt'),
  Building(
      BuildingType.theater, 'UnitedArtistsStonestownTwin', '501BuckinghamWay'),
  Building(BuildingType.theater, 'AMCMetreon16', '1354thSt#3000'),
  Building(BuildingType.restaurant, 'K\'sKitchen', '1923OceanAve'),
  Building(BuildingType.restaurant, 'ChaiyaThaiRestaurant', '72ClaremontBlvd'),
  Building(BuildingType.restaurant, 'LaCiccia', '29130thSt'),
//double一下
  Building(BuildingType.theater, 'CineArtsattheEmpire', '85WPortalAve'),
  Building(BuildingType.theater, 'TheCastroTheater', '429CastroSt'),
  Building(BuildingType.theater, 'AlamoDrafthouseCinema', '2550MissionSt'),
  Building(BuildingType.theater, 'RoxieTheater', '311716thSt'),
  Building(
      BuildingType.theater, 'UnitedArtistsStonestownTwin', '501BuckinghamWay'),
  Building(BuildingType.theater, 'AMCMetreon16', '1354thSt#3000'),
  Building(BuildingType.restaurant, 'K\'sKitchen', '1923OceanAve'),
  Building(BuildingType.restaurant, 'ChaiyaThaiRestaurant', '72ClaremontBlvd'),
  Building(BuildingType.restaurant, 'LaCiccia', '29130thSt'),
];

class _TitleSelection extends StatelessWidget {
  final String title;
  final String subTitle;
  final int starCount;

  _TitleSelection({this.title, this.subTitle, this.starCount, Key key})
      : super(key: key);

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

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;
  return Column(
    //mainaxis跟我们前面提到的crossaxis相对应，对Column来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（freespace），min表示尽量少占用
    // freespace；类似于Android的wrap_content。
    // 对应的，还有MainAxisSize.max
    mainAxisSize: MainAxisSize.min,
    // 沿着mainaxis居中放置
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      Container(
        margin: EdgeInsets.only(top: 7.0),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 13.0,
          ),
        ),
      ),
    ],
  );
}
