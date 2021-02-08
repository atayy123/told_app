import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/screens/articlepostscreen.dart';

class ArticleGrid extends StatelessWidget {
  final List<dynamic> posts;

  const ArticleGrid({Key key, this.posts}) : super(key: key);

  List<ArticlePost> _articleList() {
    List<ArticlePost> _list = [];
    for (var i = 0; i < posts.length; i++) {
      if (posts[i] is ArticlePost) {
        _list.add(posts[i]);
      }
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    final List<ArticlePost> list = _articleList();
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.white,
            child: InkWell(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ArticlePostScreen(item: list[index])));
                },
                leading: Icon(Icons.bookmark_border_outlined),
                title: Text(list[index].title),
                subtitle: Text(list[index].likes.toString() + " likes"),
              ),
            ),
          );
        });
  }
}
