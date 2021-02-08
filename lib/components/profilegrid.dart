import 'package:flutter/material.dart';
import 'package:told_app/components/videobuilder.dart';
import 'package:told_app/screens/photopostscreen.dart';
import 'package:told_app/screens/videopostscreen.dart';

import '../class.dart';

class PhotoGrid extends StatelessWidget {
  final PhotoPost item;

  const PhotoGrid({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PhotoPostScreen(
                      item: item,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage(item.photoUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class VideoGrid extends StatelessWidget {
  final VideoPost item;

  const VideoGrid({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPostScreen(
                      item: item,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: VideoPlayerScreen(
            video: item.videoUrl,
            typeof: "asset",
          ),
        ),
      ),
    );
  }
}

class ProGrid extends StatelessWidget {
  final List<dynamic> posts;

  const ProGrid({Key key, this.posts}) : super(key: key);

  List<Widget> _profgrid() {
    List<Widget> _gridlist = [];
    for (var i = 0; i < posts.length; i++) {
      if (posts[i] is PhotoPost) {
        _gridlist.add(PhotoGrid(
          item: posts[i],
        ));
      } else if (posts[i] is VideoPost) {
        _gridlist.add(VideoGrid(
          item: posts[i],
        ));
      } else if (posts[i] is Retold) {
        if (posts[i].post is PhotoPost) {
          _gridlist.add(PhotoGrid(
            item: posts[i].post,
          ));
        } else if (posts[i].post is VideoPost) {
          _gridlist.add(VideoGrid(
            item: posts[i].post,
          ));
        }
      }
    }
    return _gridlist;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.count(
          padding: EdgeInsets.only(top: 15),
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          physics: BouncingScrollPhysics(),
          children: _profgrid(),
        ),
      ),
    );
  }
}
