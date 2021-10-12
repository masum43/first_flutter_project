
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  double defaultScreenPadding = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"),),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(defaultScreenPadding),
            child: const Image(
              image: AssetImage('assets/user.png'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(defaultScreenPadding),
            child: const Text("Md. Masum Billah", style: TextStyle(
              fontSize: 20.0
            ),),
          )
        ],
      ),
    );
  }
}
