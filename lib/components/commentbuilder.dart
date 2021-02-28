import 'package:flutter/material.dart';
import 'package:told_app/screens/profile.dart';
import '../class.dart';
import '../data.dart';

class CommentBuilder extends StatefulWidget {
  final List<Comment> comments;
  CommentBuilder({this.comments});

  @override
  _CommentBuilderState createState() => _CommentBuilderState();
}

class _CommentBuilderState extends State<CommentBuilder> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15, right: 10),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (value) {
                    comments.add(
                        Comment(comment: value, likes: 0, user: currentUser));
                    _controller.clear();
                    setState(() {});
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter a comment",
                    icon: Container(
                      width: 50.0,
                      height: 50.0,
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
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage(currentUser.userPhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 10.0, bottom: 15.0, right: 10),
          itemCount: widget.comments.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              user: widget.comments[index].user,
                            )));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
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
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage(
                                widget.comments[index].user.userPhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.comments[index].user.username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          width: 225,
                          child: Text(
                            widget.comments[index].comment,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: widget.comments[index].isLiked
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                          color: widget.comments[index].isLiked
                              ? Colors.red
                              : Colors.black,
                          iconSize: 25.0,
                          onPressed: () {
                            setState(() {
                              widget.comments[index].isLiked =
                                  !widget.comments[index].isLiked;
                            });
                          },
                        ),
                        Text(widget.comments[index].likes.toString())
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
