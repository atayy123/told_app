import 'package:flutter/material.dart';

import 'login.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "T O L D",
            style: TextStyle(fontSize: 36),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(10),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.multiline,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  hintText: 'Username',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.multiline,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.all(10)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              height: 50,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () async {
                return showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("The username is already taken."),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(fontSize: 22),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.black),
        width: double.infinity,
        child: FlatButton(
            height: 50,
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginPage();
              }));
            },
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 22, color: Theme.of(context).primaryColor),
            )),
      ),
    );
  }
}
