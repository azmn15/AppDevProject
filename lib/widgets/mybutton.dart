import 'package:flutter/material.dart';
class myButton extends StatelessWidget{
  final function onPressed;
  final String name;
  myButton({this.name,this.onPressed});
  @override
  Widget build(BuildContext context){
    return  Container(
                       height: 45,
                       width: double.infinity,
                       child: RaisedButton(
                         child: Text(name),
                         color: Colors.grey, 
                         onPressed: onPressed,
                     ),
                    );
  }
}