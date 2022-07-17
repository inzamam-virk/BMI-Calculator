import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key,required this.onPress,
  required this.txt}) :super(key: key);

  final String txt;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        margin: EdgeInsets.all(7),
        width: 35,
        height: 35,
        child: Center(child: Text(txt,style: TextStyle(fontSize: 25,color: Colors.white))),
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
