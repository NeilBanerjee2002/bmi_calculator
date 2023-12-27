import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('                   RESULT'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
        Container(
          padding: EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Your Result',
            style: TextStyle(
                fontSize: 45.0, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: kactiveCardColour,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    resultText.toUpperCase(),
                    style: kResultTextstyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    bmiResult,
                    style: knumberstyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kResultTextstyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Container(
            child: Center(
              child: Text(
                'RE-CALCULATE',
                style: knumberstyle.copyWith(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            color: kbottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kbottomContainerHeight,
          ),
        ),
      ]),
    );
  }
}
