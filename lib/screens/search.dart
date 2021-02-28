import 'package:flutter/material.dart';
import 'package:told_app/data.dart';
import 'package:told_app/screens/trendscreen.dart';
import 'package:told_app/screens/userlist.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Container(
            child: TextField(
              cursorHeight: 25,
              style: TextStyle(fontSize: 20.0),
              autofocus: true,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                text: "Users",
              ),
              Tab(text: "Trends")
            ],
          ),
        ),
        body: TabBarView(children: [
          UserList(
            users: users,
          ),
          ListView.builder(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: trendlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TrendScreen(item: trendlist[index])));
                  },
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black87,
                    child: CircleAvatar(
                      radius: 18,
                      foregroundColor: Colors.black87,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Text(
                        "#",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  title: Text(
                    trendlist[index].header,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle:
                      Text(trendlist[index].postnumber.toString() + " posts"),
                );
              })
        ]),
      ),
    );
  }
}
