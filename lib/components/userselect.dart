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

  @override
  void initState() {
    for (var i = 0; i < widget.users.length; i++) {
      isSelected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  for (var ind = 0; ind < widget.users.length; ind++) {
                    if (isSelected[ind]) {
                      for (var j = 0; j < dms.length; j++) {
                        if (users[ind] == dms[j].user) {
                          dms[j].messages.insert(
                              0,
                              PostMessage(
                                  post: widget.post,
                                  user: currentUser,
                                  time: "19:07"));
                        }
                      }
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
