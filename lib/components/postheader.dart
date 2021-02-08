import 'package:flutter/material.dart';
import 'package:told_app/screens/profile.dart';
import '../class.dart';

class PostHeader extends StatelessWidget {
  final User username;
  final String location;
  final String time;
  PostHeader({this.username, this.location, this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      user: username,
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
              image: AssetImage(username.userPhoto),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        username.username,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: location != null ? Text(location + " • " + time) : Text(time),
      trailing: IconButton(
        icon: Icon(Icons.more_vert),
        color: Colors.black,
        onPressed: () => print('More'),
      ),
    );
  }
}
