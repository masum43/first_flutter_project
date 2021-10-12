import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            equation,
            style: TextStyle(fontSize: equationFontSize),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize: resultFontSize),
          ),
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
                    buildButton(context, "C", 1, Colors.redAccent),
                    buildButton(context, "⌫", 1, Colors.blue),
                    buildButton(context, "÷", 1, Colors.blue),
                  ]),
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
                    buildButton(context, "x", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton(context, "-", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton(context, "+", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton(context, "=", 2, Colors.redAccent),
                  ]),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) equation = "0";
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          // (3) Evaluate expression:
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = '$eval';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
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
}
