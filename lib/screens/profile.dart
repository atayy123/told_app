import 'package:flutter/material.dart';
import 'package:told_app/components/articlegrid.dart';
import 'package:told_app/components/profilegrid.dart';
import 'package:told_app/screens/userlist.dart';
import '../class.dart';
import '../data.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _selectedTabBar = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 30, right: 16),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(widget.user.userPhoto),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.user.username,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    widget.user == currentUser
                        ? Container()
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: widget.user.isFollowed
                                      ? Colors.black
                                      : Colors.white),
                              color: widget.user.isFollowed
                                  ? Colors.white
                                  : Color(0xFFE4395F),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.user.isFollowed =
                                        !widget.user.isFollowed;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 24,
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.user.isFollowed
                                          ? "Following"
                                          : "Follow",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: widget.user.isFollowed
                                            ? Color(0xFFE4395F)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Text(
                widget.user.bio,
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.grey[400],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "TOLDS",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.user.tolds.toString(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "RETOLDS",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.user.retolds.toString(),
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserListPage(
                                      title: "Followers",
                                      users: users,
                                    )));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "FOLLOWERS",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.user.followers.toString(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserListPage(
                                      title: "Following",
                                      users: users,
                                    )));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "FOLLOWING",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              widget.user.following.toString(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.grey[400],
              ),
              TabBar(
                  indicatorColor: Colors.red,
                  onTap: (index) {
                    setState(() {
                      if (index == 0) {
                        _selectedTabBar = index;
                      } else if (index == 1) {
                        _selectedTabBar = index;
                      } else {
                        _selectedTabBar = index;
                      }
                    });
                  },
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.web,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.image,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.play_circle_outline,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.book,
                        color: Colors.black,
                        size: 24,
                      ),
                    )
                  ]),
              Builder(builder: (_) {
                if (_selectedTabBar == 0) {
                  return ProGrid(
                    posts: userPosts,
                  );
                } else if (_selectedTabBar == 1) {
                  return ProGrid(posts: trendposts);
                } else if (_selectedTabBar == 2) {
                  return ProGrid(posts: postsForYou);
                } else {
                  return ArticleGrid(
                    posts: userPosts,
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
