import 'package:first_flutter_project/services/api_client.dart';
import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  String dropDownFromValue = 'USD';
  String dropDownToValue = 'BDT';
  late List<String> items = [];

  ApiClient client = ApiClient();
  Future<List<String>?> getCurrencyList() async{
    return await client.getCurrencies();
  }

  @override
  void initState() {
    client.getCurrencies().then((value) {
      if(mounted) {
        setState(() {
          items = value!;
        });
      }
    });


    // (() async{
    //   List<String>? list = await client.getCurrencies();
    //   getConvertedResult();
    //   if(mounted) {
    //     setState(() {
    //       items = list!;
    //       print('currencyList ${items.toString()}');
    //     });
    //   }
    //
    // })();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                          value: dropDownFromValue,

                          icon: Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(items)
                            );
                          }
                          ).toList(),
                          onChanged: (String? newValue){
                            setState(() {
                              dropDownFromValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                flex: 1,
              ),

              Expanded(
                child: Center(
                    child: Text(
                      equation,
                      style: TextStyle(fontSize: equationFontSize,
                      ),
                    )
                ),
                flex: 1,
              ),
            ],
          )
        ),

        Container(
          //alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            value: dropDownToValue,

                            icon: Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(items)
                              );
                            }
                            ).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                dropDownToValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  flex: 1,
                ),

                Expanded(
                  child: Center(
                      child: Text(
                        result,
                        style: TextStyle(fontSize: equationFontSize,
                        ),
                      )
                  ),
                  flex: 1,
                ),
              ],
            )
        ),

        const Expanded(
          child: Divider(
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton(context, "7", 1, Colors.black54),
                    buildButton(context, "8", 1, Colors.black54),
                    buildButton(context, "9", 1, Colors.black54),
                  ]),
                  TableRow(children: [
                    buildButton(context, "4", 1, Colors.black54),
                    buildButton(context, "5", 1, Colors.black54),
                    buildButton(context, "6", 1, Colors.black54),
                  ]),
                  TableRow(children: [
                    buildButton(context, "1", 1, Colors.black54),
                    buildButton(context, "2", 1, Colors.black54),
                    buildButton(context, "3", 1, Colors.black54),
                  ]),
                  TableRow(children: [
                    buildButton(context, ".", 1, Colors.black54),
                    buildButton(context, "0", 1, Colors.black54),
                    buildButton(context, "00", 1, Colors.black54),
                  ]),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .25,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton(context, "C", 2, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton(context, "⌫", 2, Colors.redAccent),
                  ]),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildButton(BuildContext context, String buttonText,
      double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: const BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: const EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  buttonPressed(String buttonText) async {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) equation = "0";
      }
      else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });


    client.getConvertResult(dropDownFromValue, dropDownToValue, equation)!.then((value) {
      if(mounted) {
        setState(() {
          result = value;
        });
      }
    });


  }
}
