import 'package:flutter/material.dart';
class ChangeScreeen extends StatelessWidget{
  final String whichAccount;
  final Function onTap;
  final String name;
  ChangeScreeen({this.name, this.onTap, this.whichAccount});
  @override
  Widget build(BuildContext context){
    return Row(
               children: <Widget>[
               Text(whichAccount),
               SizedBox(
                width: 10,
                ),
               GestureDetector(
             onTap: onTap,
           child: Text(
           name, 
           style: TextStyle(
           color: Colors.cyan,
           fontSize: 20,
          fontWeight: FontWeight.bold),
          ),
         ),
       ],
     );
  }
}