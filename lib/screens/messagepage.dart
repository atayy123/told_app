import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:told_app/components/articlebuilder.dart';
import 'package:told_app/components/photobuilder.dart';
import 'package:told_app/components/videobuilder.dart';
import 'package:told_app/data.dart';
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

  void takePhoto() async {
    final _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      pickedFile = _pickedFile;
      widget.dm.messages.insert(0,
          ImageMessage(url: pickedFile.path, user: currentUser, time: "4.30"));
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

  Widget _postmessageselect(post) {
    if (post is PhotoPost) {
      return PhotoBuilder(item: post);
    } else if (post is VideoPost) {
      return VideoBuilder(item: post);
    } else if (post is ArticlePost) {
      return ArticleBuilder(item: post);
    } else {
      return Container();
    }
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
                child: Image.asset(msg.url),
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
              child: _postmessageselect(msg.post)),
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
            onPressed: () {},
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
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
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
                    widget.dm.messages.insert(0,
                        Message(msg: input, user: currentUser, time: "4.30"));
                    _controller.clear();
                    setState(() {});
                  },
                  controller: _controller,
                  textCapitalization: TextCapitalization.sentences,
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message"),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
