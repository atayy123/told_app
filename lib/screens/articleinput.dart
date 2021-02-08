import 'package:flutter/material.dart';

class ArticleInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Article"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  labelText: 'Title',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  labelText: 'Article',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              FlatButton(
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  onPressed: () => print("Post Article"),
                  child: Text(
                    "POST",
                    style: TextStyle(fontSize: 22),
                  )),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
