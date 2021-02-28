import 'package:flutter/material.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/profile.dart';
import '../class.dart';

class PostHeader extends StatelessWidget {
  final User user;
  final String location;
  final String time;
  PostHeader({this.user, this.location, this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      user: user,
                    )));
      },
      leading: Container(
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
              image: AssetImage(user.userPhoto),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        user.username,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: location != null ? Text(location + " • " + time) : Text(time),
      trailing: IconButton(
          icon: Icon(Icons.more_vert),
          color: Colors.black,
          onPressed: () => showModalBottomSheet(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
              context: context,
              builder: (context) {
                bool isMe = (user != currentUser);
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
                          title: Text(isMe ? "Report" : "Post to other Apps"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("Copy Link"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text("Share to"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                              isMe ? "Turn on Post Notifications" : "Archive"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(isMe ? "Unfollow" : "Delete"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text(isMe ? "Mute" : "Edit"),
                        ),
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
