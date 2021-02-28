import 'package:flutter/material.dart';
import '../class.dart';
import '../data.dart';

class SelectUser extends StatefulWidget {
  final List<User> users;
  final post;

  SelectUser({Key key, this.users, this.post}) : super(key: key);
  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  List<bool> isSelected = [];
  DateTime now = DateTime.now();

  @override
  void initState() {
    for (var i = 0; i < widget.users.length; i++) {
      isSelected.add(false);
    }
    super.initState();
  }

  String _getMinute(DateTime now) {
    if (now.minute < 10) {
      return "0" + now.minute.toString();
    } else {
      return now.minute.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: widget.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(top: 20),
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
                              child: Checkbox(
                                  value: isSelected[index],
                                  onChanged: (value) {
                                    isSelected[index] = !isSelected[index];
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
                  List<bool> isSent = [];
                  for (var ind = 0; ind < widget.users.length; ind++) {
                    isSent.add(false);
                  }

                  for (var ind = 0; ind < widget.users.length; ind++) {
                    if (isSelected[ind]) {
                      for (var j = 0; j < dms.length; j++) {
                        if (users[ind] == dms[j].user) {
                          isSent[ind] = true;
                          dms[j].messages.insert(
                              0,
                              PostMessage(
                                  post: widget.post,
                                  user: currentUser,
                                  time: now.hour.toString() +
                                      ":" +
                                      _getMinute(now)));
                        }
                      }
                    }
                  }

                  for (var ind = 0; ind < isSent.length; ind++) {
                    if (isSent[ind] == false && isSelected[ind] == true) {
                      DM newDM =
                          DM(user: widget.users[ind], unread: false, messages: [
                        PostMessage(
                            post: widget.post,
                            user: currentUser,
                            time: now.hour.toString() + ":" + _getMinute(now))
                      ]);
                      dms.add(newDM);
                    }
                  }

                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "SEND",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
