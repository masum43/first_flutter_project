import 'package:first_flutter_project/pages/tabbar/views/calculator/calculator_view.dart';
import 'package:first_flutter_project/pages/tabbar/views/currency/currency_converter.dart';
import 'package:first_flutter_project/services/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {


  String toolBarText = 'Calculation';

  //Setting the variables
  late List<String> currencies;
  late String from = "USD";
  late String to = "BDT";
  late double rate;
  late String resultCurrency = "";

  // String fromCurrency = "USD";
  // String toCurrency = "GBP";



  void onTap(int i){
    setState(() {
      if(i ==0) toolBarText = 'Calculation';
      else if(i == 1) toolBarText = 'Currency Converter';
      else toolBarText = 'Other';
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: onTap,
            tabs: [
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.adjust)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: Text(toolBarText),
        ),
        body: TabBarView(
          children: [
            CalculatorView(),
            CurrencyConverter(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }



}
