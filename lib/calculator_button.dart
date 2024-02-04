import 'package:flutter/material.dart';

typedef OnDigitBtnClick = void Function(String);

class CalculatorButton extends StatelessWidget {
  final Color color;
  final String buttonText;

  final OnDigitBtnClick onBtnClick;

  const CalculatorButton({
    super.key,
    required this.buttonText,
    required this.color,
    required this.onBtnClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            print("Pressed on $buttonText");
            onBtnClick!(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
