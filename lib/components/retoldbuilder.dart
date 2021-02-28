import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/photobuilder.dart';
import 'package:told_app/components/postheader.dart';
import 'package:told_app/components/videobuilder.dart';

import 'articlebuilder.dart';

class RetoldBuilder extends StatelessWidget {
  final Retold item;

  const RetoldBuilder({Key key, this.item}) : super(key: key);

  Widget finder() {
    if (item.post is PhotoPost) {
      return PhotoBuilder(item: item.post);
    } else if (item.post is VideoPost) {
      return VideoBuilder(item: item.post);
    } else if (item.post is ArticlePost) {
      return ArticleBuilder(item: item.post);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () => print("Like post"),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                PostHeader(
                  user: item.user,
                  time: item.time,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black12),
                    child: finder())
              ],
            )));
  }
}
