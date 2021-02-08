import 'package:flutter/material.dart';
import 'package:told_app/components/videobuilder.dart';

class NewVideoScreen extends StatelessWidget {
  final String videoPath;

  const NewVideoScreen({
    Key key,
    this.videoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Post"),
        ),
        body: ListView(physics: BouncingScrollPhysics(), children: [
          VideoPlayerScreen(
            video: videoPath,
            typeof: "file",
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  labelText: 'Title',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              FlatButton(
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onPressed: () => print(videoPath),
                  child: Text(
                    "POST",
                    style: TextStyle(fontSize: 22),
                  )),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}
