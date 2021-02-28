import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/likecommentbar.dart';
import 'package:told_app/components/postheader.dart';

class PhotoBuilder extends StatefulWidget {
  final PhotoPost item;

  const PhotoBuilder({Key key, this.item}) : super(key: key);
  @override
  _PhotoBuilderState createState() => _PhotoBuilderState();
}

class _PhotoBuilderState extends State<PhotoBuilder>
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
            location: widget.item.location,
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  width: double.infinity,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 400.0),
                    child: Image.asset(
                      widget.item.photoUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
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
            height: 5,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                widget.item.descrip,
                style: TextStyle(fontSize: 16),
              )),
          LikeCommentBar(
            post: widget.item,
          )
        ],
      ),
    );
  }
}
