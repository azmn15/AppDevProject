import 'package:flutter/material.dart';
class mybutton extends StatelessWidget{
  final function onPressed;
  final String name;
  mybutton({this.name,this.onPressed});
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