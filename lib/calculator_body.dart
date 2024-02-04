import 'package:flutter/material.dart';

import 'calculator_button.dart';

class CalculatorBody extends StatefulWidget {
  CalculatorBody({super.key});

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  String resultText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonText: "7",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "8",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "9",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "/",
                  onBtnClick: onOperatorClick,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonText: "4",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "5",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "6",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "*",
                  onBtnClick: onOperatorClick,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonText: "1",
                  color: Colors.grey,
                  onBtnClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonText: "2",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "3",
                  onBtnClick: onDigitClick,
                  color: Colors.grey,
                ),
                CalculatorButton(
                  buttonText: "-",
                  color: Colors.blue,
                  onBtnClick: onOperatorClick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonText: ".",
                  color: Colors.grey,
                  onBtnClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonText: "0",
                  color: Colors.grey,
                  onBtnClick: onDigitClick,
                ),
                CalculatorButton(
                  buttonText: "=",
                  color: Colors.blue,
                  onBtnClick: onEqualClick,
                ),
                CalculatorButton(
                  buttonText: "+",
                  onBtnClick: onOperatorClick,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  buttonText: "AC",
                  color: Colors.grey,
                  onBtnClick: onACClick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String savedNumber = "";
  String savedOperator = "";

  void onEqualClick(String btnText){
    String newNumber=resultText;
    String result = calculate(savedNumber, savedOperator, newNumber);
    resultText = result;
    savedNumber="";
    savedOperator="";
    setState(() {});
  }

  onACClick(String btnText){
    savedOperator="";
    savedNumber="";
    resultText="";
    setState(() {});
  }
  onOperatorClick(String btnText) {
    if (savedNumber.isEmpty) {
      savedNumber = resultText;
      savedOperator = btnText;
      resultText = "";
      print(resultText);
      setState(() {});
    } else {
      String newNumber = resultText;
      String result = calculate(savedNumber, savedOperator, newNumber);
      savedNumber = result;
      savedOperator = btnText;
      resultText = result;
      setState(() {});
    }
  }

  void onDigitClick(String buttonText) {
    resultText += buttonText;
    //print(resultText);
    setState(() {});
  }

  onDotClick(String btnText){
    resultText+=btnText;
    if(resultText.contains(".")){
      return ;
    }
  }

  String calculate(String lhs, String operator, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);

    double res=0;
    if (operator == "+") {
      res = n1 + n2;
    } else if (operator == "-") {
      res = n1 - n2;
    } else if (operator == "*") {
      res = n1 * n2;
    } else if (operator == "/") {
      res = n1 / n2;
    }
    return res.toString();
  }
}
