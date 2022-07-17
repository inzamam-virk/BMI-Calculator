import 'package:flutter/material.dart';
class ReuseableCard extends StatelessWidget {
  const ReuseableCard({Key? key,required this.cardChild,required this.onPress}) : super(key: key);

  final Widget cardChild;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:GestureDetector(
          onTap: onPress,
          child: Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(5)
            ),
            child: cardChild,
          ),
        )
    );
  }
}
