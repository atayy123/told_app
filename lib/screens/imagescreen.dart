import 'dart:io';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String url;

  const ImageScreen({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: FileImage(File(url)))),
      ),
    );
  }
}
