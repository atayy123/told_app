import 'package:flutter/material.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/newmessage.dart';
import '../class.dart';
import 'messagepage.dart';

class DMPage extends StatefulWidget {
  final List<DM> dms;

  const DMPage({Key key, this.dms}) : super(key: key);

  @override
  _DMPageState createState() => _DMPageState();
}

class _DMPageState extends State<DMPage> {
  String _lastmessage(DM dm) {
    if (dm.messages != []) {
      if (dm.messages[0] is PostMessage) {
        return "Shared a post";
      } else if (dm.messages[0] is Message) {
        return dm.messages[0].msg;
      } else if (dm.messages[0] is ImageMessage) {
        return "Shared a photo";
      } else {
        return "Unknown message";
      }
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Direct Messages"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewMessage(
                              users: users,
                            ))).then((value) => setState(() {}));
              },
              splashRadius: 20,
            )
          ],
        ),
        body: Container(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.dms.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    if (widget.dms[index].unread) {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagePage(
                                    dm: widget.dms[index],
                                  )));
                    } else {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagePage(
                                    dm: widget.dms[index],
                                  )));
                    }
                    setState(() {
                      widget.dms[index].unread = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(10),
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
                                    widget.dms[index].user.userPhoto),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.dms[index].user.username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                _lastmessage(widget.dms[index]),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.dms[index].messages != []
                                ? widget.dms[index].messages[0].time
                                : ""),
                            SizedBox(
                              height: 5,
                            ),
                            widget.dms[index].unread
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red[400],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "NEW",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                : SizedBox(
                                    width: 42,
                                    height: 30,
                                  )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
