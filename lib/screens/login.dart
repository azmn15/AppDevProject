import 'package:flutter/material.dart';
import 'package:appdevproject/screens/signup.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation(){
  final FormState? _form = _formKey.currentState;
  if(_form!.validate()) {
    print("Yes");
  }
  else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(     
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Text(
                       "Login",
                       style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                     ),
                     TextFormField(
                       validator: (value){
                         if(value == ""){
                           return "Please fill The Email";
                         }
                         else if(!regExp.hasMatch(value!)){
                           return "Invalid Email";
                         }
                         return null;
                       },
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         hintText: "Email",
                         hintStyle: TextStyle(color: Colors.black),
                       ),
                     ),
                     TextFormField(
                       obscureText: obserText,
                       validator: (value){
                         if(value == ""){
                           return "Please fill in the Password";
                         }
                         else if(value!.length <8){
                           return "Password it too short";
                         }
                         return null;
                       },
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         hintText: "Password",
                         suffixIcon: GestureDetector(
                           onTap: (){
                             FocusScope.of(context).unfocus();
                             setState(() {
                               obserText =!obserText;
                             });
                           },
                           child: Icon(
                             obserText == true?
                             Icons.visibility : Icons.visibility_off, 
                             color: Colors.black
                             ),
                           ),
                         hintStyle: TextStyle(color: Colors.black),
                         ),
                     ),
                    
                    myButton(onPressed:(){
                      vaildation();
                    },
                    name: "Login",
                    ), //myButton
                     Row(
                       children: <Widget>[
                         Text("I Don't have an Account"),
                         SizedBox(
                           width: 10,
                         ),
                         GestureDetector(
                       onTap: (){
                         Navigator.of(context).pushReplacement(
                           MaterialPageRoute(
                             builder: (ctx) => SignUp(),
                          ),
                        );
                       },
                       child: Text(
                         "Sign up", 
                         style: TextStyle(
                           color: Colors.cyan,
                           fontSize: 20,
                           fontWeight: FontWeight.bold),
                           ),
                         ),
                       ],
                     ),
                   ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}