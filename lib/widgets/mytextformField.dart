import 'package:flutter/material.dart';

class mytextformField extends StatelessWidget{
  final Function validator;
  final String name;

  mytextformField({this.name,this.validator});
  @override
  Widget build(BuildContext context){
  return TextFormField(
       validator: validator,
       decoration: InputDecoration(
       border: OutlineInputBorder(),
       hintText: name,
     ),
   );
  }
}