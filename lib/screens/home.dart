import 'package:flutter/material.dart';
import 'package:told_app/components/articlebuilder.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/retoldbuilder.dart';
import 'package:told_app/components/videobuilder.dart';
import 'package:told_app/screens/dmpage.dart';
import '../components/photobuilder.dart';
import '../data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("T O L D"),
            actions: [
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DMPage(dms: dms)));
                },
                splashRadius: 20,
              )
            ],
            centerTitle: true,
            bottom: TabBar(
              tabs: [Tab(text: "Following"), Tab(text: "For You")],
            ),
          ),
          body: TabBarView(children: [
            Feed(
              feedlist: postsFollowing,
            ),
            Feed(
              feedlist: postsForYou,
            ),
          ]),
        ));
  }
}

class Feed extends StatelessWidget {
  final List feedlist;

  const Feed({Key key, this.feedlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (feedlist[index] is PhotoPost) {
          return PhotoBuilder(item: feedlist[index]);
        } else if (feedlist[index] is VideoPost) {
          return VideoBuilder(item: feedlist[index]);
        } else if (feedlist[index] is ArticlePost) {
          return ArticleBuilder(item: feedlist[index]);
        } else if (feedlist[index] is Retold) {
          return RetoldBuilder(item: feedlist[index]);
        } else {
          return Container();
        }
      },
      itemCount: feedlist.length,
    );
  }
}
