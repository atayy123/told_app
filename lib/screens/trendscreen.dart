import 'package:flutter/material.dart';
import 'package:told_app/screens/home.dart';
import '../class.dart';
import '../data.dart';

class TrendScreen extends StatelessWidget {
  final Trend item;
  TrendScreen({this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.header),
        centerTitle: true,
      ),
      body: Feed(
        feedlist: trendposts,
      ),
    );
  }
}
