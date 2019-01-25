import 'package:flutter/material.dart';

//NewsDetailPage有毒
class NewsDetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News detail page"),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text("news detail...."),
      ),
    );
  }

}
