import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:told_app/components/postmessage.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/imagescreen.dart';
import '../class.dart';

class MessagePage extends StatefulWidget {
  final DM dm;

  const MessagePage({Key key, this.dm}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _controller = TextEditingController();
  PickedFile pickedFile;
  final ImagePicker _picker = ImagePicker();
  DateTime now = new DateTime.now();

  String _getMinute(DateTime now) {
    if (now.minute < 10) {
      return "0" + now.minute.toString();
    } else {
      return now.minute.toString();
    }
  }

  void takePhoto() async {
    final _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      pickedFile = _pickedFile;
      widget.dm.messages.insert(
          0,
          ImageMessage(
              url: pickedFile.path,
              user: currentUser,
              time: now.hour.toString() + ":" + _getMinute(now)));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _messagebuild(Message msg, bool isMe) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isMe ? Colors.blue[100] : Colors.lightBlue[200],
      ),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80, right: 10)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80, left: 10),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              msg.msg,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              msg.time,
            ),
          )
        ],
      ),
    );
  }

  Widget _imagemessagebuild(ImageMessage msg, bool isMe) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isMe ? Colors.blue[100] : Colors.lightBlue[200],
      ),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80, right: 10)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80, left: 10),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageScreen(
                                  url: msg.url,
                                )));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 4 / 7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: FileImage(File(msg.url)))),
                  ),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                msg.time,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _postmessagebuild(PostMessage msg, bool isMe) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isMe ? Colors.blue[100] : Colors.lightBlue[200],
      ),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80, right: 10)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80, left: 10),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: PostMessageBuild(item: msg.post)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                msg.time,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.dm.user.username,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showModalBottomSheet(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                context: context,
                builder: (context) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          onTap: () {},
                          child: ListTile(
                            title: Text("Report"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text("Delete"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text("Block"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text("Restrict"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text("Unfollow"),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text("Mute"),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            splashRadius: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final bool isMe = widget.dm.messages[index].user == currentUser;
                if (widget.dm.messages[index] is Message) {
                  return _messagebuild(widget.dm.messages[index], isMe);
                } else if (widget.dm.messages[index] is PostMessage) {
                  return _postmessagebuild(widget.dm.messages[index], isMe);
                } else if (widget.dm.messages[index] is ImageMessage) {
                  return _imagemessagebuild(widget.dm.messages[index], isMe);
                } else {
                  return _postmessagebuild(widget.dm.messages[index], isMe);
                }
              },
              itemCount: widget.dm.messages.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.black12,
            ),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () {
                      takePhoto();
                    }),
                Expanded(
                    child: TextField(
                  onSubmitted: (input) {
                    widget.dm.messages.insert(
                        0,
                        Message(
                            msg: input,
                            user: currentUser,
                            time: now.hour.toString() + ":" + _getMinute(now)));
                    _controller.clear();
                    setState(() {});
                  },
                  controller: _controller,
                  textCapitalization: TextCapitalization.sentences,
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message"),
                )),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      widget.dm.messages.insert(
                          0,
                          Message(
                              msg: _controller.text,
                              user: currentUser,
                              time:
                                  now.hour.toString() + ":" + _getMinute(now)));
                      _controller.clear();
                      setState(() {});
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
