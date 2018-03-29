import 'package:flutter/material.dart';
import 'package:flutter_tableview/newsStruct.dart';

class NewsItemList extends StatefulWidget{

  final News news;

  NewsItemList(News news)
  :news = news,
  super(key:new ObjectKey(news));

  @override
  NewsItemState createState(){
    return new NewsItemState(news);
  }

}

class NewsItemState extends State<NewsItemList> {

  final News news;

  NewsItemState(this.news);


  @override
  Widget build(BuildContext context) {
    return new ListTile(
        onTap:null,
        leading: new CircleAvatar(
          backgroundColor: Colors.blue,
          child:new Text("add image here")
          //child: new Image(image: new AssetImage(news.avatarImage)),
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(news.title)),
            new Expanded(child: new Text(news.description))
          ],
        )
    );
  }
}