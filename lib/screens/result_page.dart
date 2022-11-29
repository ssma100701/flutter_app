import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmi, required this.bmiInterpretation, required this.bmiResult});

  final String bmiResult;
  final String bmi;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Your Result',
            style: kTitleTextStyle,
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiInterpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(onTapped: () {
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
