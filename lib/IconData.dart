import 'package:flutter/material.dart';

class Icondata extends StatelessWidget {

  const Icondata({Key? key, required this.icon,required this.title,required this.gender}) : super(key: key);
  final IconData icon;
  final int gender ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: gender == 0 ? Colors.white : Colors.grey,),
        Text(title, style: TextStyle(
            color: gender == 0 ? Colors.white : Colors.grey),),
      ],
    );
  }
}
