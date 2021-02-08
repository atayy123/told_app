import 'package:flutter/material.dart';
import 'package:told_app/screens/messagepage.dart';
import '../class.dart';
import '../data.dart';

class NewMessage extends StatefulWidget {
  final List<User> users;

  const NewMessage({Key key, this.users}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  User chosenUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Message"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Row(
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
                                  image:
                                      AssetImage(widget.users[index].userPhoto),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            widget.users[index].username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Radio(
                                    value: widget.users[index],
                                    groupValue: chosenUser,
                                    onChanged: (val) {
                                      chosenUser = val;
                                      setState(() {});
                                    })),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    bool endFunc = false;
                    for (var j = 0; j < dms.length; j++) {
                      if (chosenUser == dms[j].user) {
                        endFunc = true;
                        dms[j].unread = false;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return MessagePage(
                            dm: dms[j],
                          );
                        }));
                      }
                    }
                    if (endFunc != true) {
                      DM newDM =
                          DM(user: chosenUser, unread: false, messages: []);
                      dms.add(newDM);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MessagePage(
                          dm: newDM,
                        );
                      }));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        "CHAT",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
