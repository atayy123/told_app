import 'package:flutter/material.dart';
import 'package:told_app/components/sharebutton.dart';
import 'package:told_app/screens/camerapage.dart';
import 'package:told_app/screens/mapscreen.dart';
import 'package:told_app/screens/trend.dart';
import 'package:told_app/screens/profile.dart';
import 'package:told_app/screens/home.dart';
import 'data.dart';

void main() {
  runApp(ToldApp());
}

class ToldApp extends StatefulWidget {
  @override
  _ToldAppState createState() => _ToldAppState();
}

class _ToldAppState extends State<ToldApp> {
  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    TrendPage(),
    CameraPage(),
    MapPage(),
    ProfilePage(
      user: matthew,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigoAccent,
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.fiber_new,
                      color: Colors.black,
                    ),
                    label: "Trending"),
                BottomNavigationBarItem(icon: ShareButton(), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    label: "Map"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: "Profile")
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ));
  }
}
