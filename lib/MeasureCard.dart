import 'package:bmi_calculator/RoundButton.dart';
import 'package:flutter/material.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({Key? key,
    required this.title,
    required this.decrement,
    required this.increment,
    required this.measure,
    required this.unit
  }) : super(key: key);
  final String title;
  final int measure;
  final String unit;
  final void Function() increment;
  final void Function() decrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((measure).toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            Text(unit,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(onPress: decrement, txt: "-"),
            RoundButton(onPress: increment, txt: "+")
          ],
        )
      ],
    );
  }
}
