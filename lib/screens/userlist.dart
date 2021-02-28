import 'package:flutter/material.dart';
import 'package:told_app/screens/profile.dart';
import '../class.dart';

class UserListPage extends StatelessWidget {
  final String title;
  final List<User> users;

  const UserListPage({Key key, this.title, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: UserList(
          users: users,
        ));
  }
}

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage(
                user: users[index],
              );
            })),
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
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
                          image: AssetImage(users[index].userPhoto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    users[index].username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
