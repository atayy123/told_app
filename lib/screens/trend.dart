import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/videobuilder.dart';
import 'package:told_app/screens/photopostscreen.dart';
import 'package:told_app/screens/search.dart';
import 'package:told_app/screens/trendscreen.dart';
import 'package:told_app/screens/videopostscreen.dart';
import '../data.dart';

class TrendPage extends StatefulWidget {
  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  List<Widget> _trendgrid(int index) {
    List<Widget> _gridlist = [];
    for (var i = 0; i < trendlist[index].posts.length; i++) {
      if (trendlist[index].posts[i] is PhotoPost) {
        _gridlist.add(GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoPostScreen(
                          item: trendlist[index].posts[i],
                        )));
          },
          child: Container(
              height: 160,
              width: 110,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(trendlist[index].posts[i].photoUrl),
                    fit: BoxFit.cover,
                  ))),
        ));
      } else if (trendlist[index].posts[i] is VideoPost) {
        _gridlist.add(GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoPostScreen(
                          item: trendlist[index].posts[i],
                        )));
          },
          child: Container(
            height: 160,
            width: 110,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: VideoPlayerScreen(
                video: trendlist[index].posts[i].videoUrl,
                typeof: "asset",
              ),
            ),
          ),
        ));
      }
    }
    return _gridlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchPage();
            }));
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Search hot trends!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: trendlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TrendScreen(item: trendlist[index])));
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black87,
                    child: CircleAvatar(
                      radius: 18,
                      foregroundColor: Colors.black87,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Text(
                        "#",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  title: Text(trendlist[index].header,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600)),
                  trailing: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      trendlist[index].postnumber.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                    height: 160,
                    child: ListView(
                        padding: EdgeInsets.all(8),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: _trendgrid(index)))
              ],
            ),
          );
        },
      ),
    );
  }
}
