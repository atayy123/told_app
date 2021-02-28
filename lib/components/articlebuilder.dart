import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';
import 'package:told_app/screens/articlepostscreen.dart';

class ArticleBuilder extends StatefulWidget {
  final ArticlePost item;

  const ArticleBuilder({Key key, this.item}) : super(key: key);
  @override
  _ArticleBuilderState createState() => _ArticleBuilderState();
}

class _ArticleBuilderState extends State<ArticleBuilder>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            PostHeader(
              user: widget.item.user,
              time: widget.item.time,
            ),
            GestureDetector(
              onDoubleTap: () {
                setState(() {
                  widget.item.isLiked = true;
                });
                _controller.forward();
              },
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            widget.item.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            widget.item.explanation,
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  ),
                  Positioned.fill(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 72,
                      ),
                    ),
                  )
                ],
              ),
            ),
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
                        builder: (context) =>
                            ArticlePostScreen(item: widget.item)));
                setState(() {});
              },
              shape: StadiumBorder(),
            ),
            SizedBox(
              height: 5,
            ),
            LikeCommentBar(
              post: widget.item,
              commenttext: true,
            )
          ],
        ));
  }
}
