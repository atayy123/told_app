import 'package:flutter/material.dart';
import 'package:told_app/class.dart';
import 'package:told_app/components/commentbuilder.dart';

class CommentScreen extends StatelessWidget {
  final List<Comment> comments;

  const CommentScreen({Key key, this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comments"),
      ),
      body: CommentBuilder(
        comments: comments,
      ),
    );
  }
}
