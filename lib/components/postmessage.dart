import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/videobuilder.dart';
import 'package:told_app/screens/articlepostscreen.dart';
import 'package:told_app/screens/photopostscreen.dart';
import 'package:told_app/screens/profile.dart';
import 'package:told_app/screens/videopostscreen.dart';

class PostMessageBuild extends StatelessWidget {
  final item;

  const PostMessageBuild({Key key, this.item}) : super(key: key);

  Widget _selectMsg(post, context) {
    if (post is PhotoPost) {
      return Column(
        children: [
          GestureDetector(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PhotoPostScreen(item: item)));
            },
            child: Container(
              width: double.infinity,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 400.0),
                child: Image.asset(
                  item.photoUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                item.descrip,
                style: TextStyle(fontSize: 16),
              )),
        ],
      );
    } else if (post is VideoPost) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoPostScreen(item: item)));
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 400),
              child: VideoPlayerScreen(
                video: item.videoUrl,
                typeof: "asset",
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                item.descrip,
                style: TextStyle(fontSize: 16),
              )),
        ],
      );
    } else if (post is ArticlePost) {
      return Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                item.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                item.explanation,
                style: TextStyle(fontSize: 16),
              )),
          SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            fillColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "READ MORE",
                style: TextStyle(fontSize: 16),
              ),
            ),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArticlePostScreen(item: item)));
            },
            shape: StadiumBorder(),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            user: item.user,
                          )));
            },
            leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    height: 40.0,
                    width: 40.0,
                    image: AssetImage(item.user.userPhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text(
              item.user.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          _selectMsg(item, context),
        ],
      ),
    );
  }
}
