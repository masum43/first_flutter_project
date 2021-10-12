import 'package:first_flutter_project/others/listview/list_view_page.dart';
import 'package:first_flutter_project/others/profile/my_profile.dart';
import 'package:first_flutter_project/pages/home/home_page.dart';
import 'package:first_flutter_project/pages/tabbar/tab_bar_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget{
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SimpleCalculator(),
        '/home': (context) => const HomePage(),
        '/list_view': (context) => const ListViewPage(),
        '/profile': (context) => const MyProfile(),
      },
    );
  }
}




