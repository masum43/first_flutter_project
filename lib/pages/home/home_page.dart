import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double buttonRadius = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Study'),),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: FlatButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
                side: const BorderSide(
                  color: Colors.blueAccent,
                  width: 1,
                  style: BorderStyle.solid
                )
              ),
              onPressed: () {navigateToAnotherActivity('/calculator');},
              child: const Text(
                "Simple Calculator",
                style: TextStyle(
                    fontSize: 20.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: FlatButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
                side: const BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid
                )
              ),
              onPressed: () {navigateToAnotherActivity('/list_view');},
              child: const Text(
                "Listview sample",
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: FlatButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius),
                  side: const BorderSide(
                      color: Colors.blue,
                      width: 1,
                      style: BorderStyle.solid
                  )
              ),
              onPressed: () {navigateToAnotherActivity('/profile');},
              child: const Text(
                "My Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToAnotherActivity(String routeName) {
   // Navigator.push(context, MaterialPageRoute(builder: (context) => statefulWidget ));
    Navigator.pushNamed(context, routeName);
  }
}