import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//NewsDetailPage有毒
class NewsDetailPage extends StatefulWidget{
  final String url;

  NewsDetailPage({Key key, this.url}): super(key: key);

  @override
  State<StatefulWidget> createState() => NewsDetailPageState(url);
}

class NewsDetailPageState extends State<NewsDetailPage> {
  String url;
  bool loaded = false;
  String detailDataStr;
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  NewsDetailPageState(this.url);

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onStateChanged.listen((state){
      print('state:${state.type}');
      if(state.type == WebViewState.finishLoad) {
        setState(() {
          loaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
//    List<Widget> titleContent = [];
//    titleContent.add(Text("Details", style: TextStyle(color: Colors.white),));
//    if(!loaded) {
//      titleContent.add(CupertinoActivityIndicator());
//    }
//    titleContent.add(Container(
//      width: 40.0,
//    ));
    return WebviewScaffold(
      url: this.url,
      appBar: AppBar(
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("Details", style: TextStyle(color: Colors.white)),
//          ],
//        ),
        title: Text("Details",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
    );
  }
}
