import 'dart:math';

import 'package:bmi_calculator/MeasureCard.dart';
import 'package:bmi_calculator/ReuseableCard.dart';
import 'package:flutter/material.dart';
import 'IconData.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int gender1 = 1;
  int gender2 = 1;
  int height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ReuseableCard(
                cardChild: Icondata(icon: Icons.male,title: "Male", gender: gender1,),
                onPress: (){
                  setState(() {
                    gender1 = 0;
                    gender2 = 1;
                  });
                },
              ),
              ReuseableCard(
                cardChild: Icondata(icon: Icons.female,title: "Female", gender: gender2,),
                onPress: (){
                  setState(() {
                    gender2 = 0;
                    gender1 = 1;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              ReuseableCard(cardChild: MeasureCard(title: "Height",
                  decrement: (){
                setState(() {
                  height--;
                }
                );
                  },
                  increment: (){
                  setState(() {
                    height++;
                  });
                  },
                  measure: height,
                  unit: "cm"),
                  onPress: (){

                  }),
              ReuseableCard(cardChild: MeasureCard(title: "Weight",
                  decrement: (){
                setState(() {
                  weight--;
                });
                  },
                  increment: (){
                setState(() {
                  weight++;
                });
                  },
                  measure: weight,
                  unit: "kg"),
                  onPress: (){}),
            ],
          ),
          GestureDetector(
            onTap: (){
              double bmi = weight/pow(height/100, 2);
              String bmistring = bmi.toStringAsFixed(2);
              String txt ;
              if(bmi<18.5){
                txt = "You are UNDER WEIGHT";
              }
              else if(bmi>18.5 && bmi<24.9){
                txt = "Your are HEALTHY";
              }
              else{
                txt = "You are OVER WEIGHT";
              }
              if(height>5 && weight>0){
                showDialog(context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Your BMI is $bmistring\n$txt"),


                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("OK"))
                        ],
                      );
                    }
                );
              }
              else{
                showDialog(context: context, builder:
                (context){
                  return AlertDialog(
                    title: const Text("Information is not valid:\n Height must be greater than 5cm\n Weight must be greater than 0kg"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Back"))
                    ],
                  );
                }
                );
              }
            },
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Center(child: Text("CALCULATE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),

            ),
          )
        ],
      ),
    );
  }
}
