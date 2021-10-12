import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPage> {

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', '0'];
  final List<int> colorCodes = <int>[600, 500, 100, 200, 300, 400, 700, 800, 900, 700, 600, 100, 200, 300, 600];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Example"),),
      body: Column(
        children: <Widget>[
          Expanded(

            child: ListView.builder(
              physics:const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Material(
                      child: InkWell(
                        focusColor: Colors.red,
                        highlightColor: Colors.red,
                        hoverColor: Colors.red,
                        splashColor: Colors.red,
                        onTap: (){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(entries[index])));
                        },
                        child: Center(child: Text('Entry ${entries[index]}'),),
                      ),
                    ),
                  );
                }
            ),
          )


        ],
      ),
    );
  }
}
