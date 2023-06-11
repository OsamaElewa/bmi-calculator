import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreen createState() => _BmiScreen();
}

class _BmiScreen extends State<BmiScreen> {
  bool isMale=true;
  double height=120.0;
  int weight=40;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body:
       Column(
         children: [
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Row(
                 children: [
                   Expanded(
                     child: GestureDetector(
                       onTap: ()
                       {
                         setState(() {
                           isMale=true;
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           color: isMale?Colors.blue : Colors.grey[300],
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image(
                                 image: AssetImage('assets/images/male.png'),
                               height: 95.0,
                               width: 95.0,
                             ),
                             SizedBox(height: 15,),
                             Text(
                               'male',
                               style: TextStyle(
                                 fontSize: 25.0,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 15.0,),
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           isMale=false;
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           color: isMale?Colors.grey[300] : Colors.blue,
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Image(
                                image: AssetImage('assets/images/female.png'),
                              height: 95,
                              width: 95,
                            ),
                             SizedBox(height: 15,),
                             Text(
                               'female',
                               style: TextStyle(
                                 fontSize: 25.0,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.0),
                   color: Colors.grey[300],
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Height',
                       style: TextStyle(
                         fontSize: 25.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       children: [
                         Text(
                           '${height.round()}',
                           style: TextStyle(
                             fontSize: 40.0,
                             fontWeight: FontWeight.w900,
                           ),
                         ),
                         Text(
                           'cm',
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.w900,
                           ),
                         ),
                       ],
                     ),
                     Slider(
                         value: height,
                         max: 220.0,
                         min: 80.0,
                         onChanged: (value){
                           setState(() {
                             height=value;
                           });
                         },
                     ),
                   ],
                 ),
               ),
             ),
           ),
           Expanded(
             child:
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'Weight',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 25.0,
                             ),
                           ),
                           Text(
                             '${weight}',
                             style: TextStyle(
                               fontWeight: FontWeight.w900,
                               fontSize: 40.0,
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     if(weight>1)
                                       weight--;
                                   });
                                 },
                                 heroTag: 'weight--',
                                 child: Icon(
                                   Icons.remove,
                                 ),
                                 mini: true,
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                                 heroTag: 'weight+',
                                 child: Icon(
                                   Icons.add,
                                 ),
                                 mini: true,
                               ),
                             ],
                           ),

                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.grey[300],
                       ),
                     ),
                   ),
                   SizedBox(width: 15.0,),
                   Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'Age',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 25.0,
                             ),
                           ),
                           Text(
                             '${age}',
                             style: TextStyle(
                               fontWeight: FontWeight.w900,
                               fontSize: 40.0,
                             ),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     if(age>1)
                                       age--;
                                   });
                                 },
                                 heroTag: 'age--',
                                 child: Icon(
                                   Icons.remove,
                                 ),
                                 mini: true,
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     age++;
                                   });
                                 },
                                 heroTag: 'age+',
                                 child: Icon(
                                   Icons.add,
                                 ),
                                 mini: true,
                               ),
                             ],
                           ),

                         ],
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.grey[300],
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           Container(
             width: double.infinity,
             child: MaterialButton(
                 onPressed: (){
                   double result=weight/pow(height/100,2);
                   print(result.round());
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context)=>BmiResult(
                             result: result.round(),
                             age: age,
                             is_male: isMale ,
                           ),
                       )
                   );
                 },
               child: Text(
                 'Calculate',
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               color: Colors.blue,
               height: 50.0,
             ),
           ),
         ],
       ),


    );
  }
}
