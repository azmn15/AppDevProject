import 'package:flutter/material.dart';
import 'package:appdevproject/screens/login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation(){
    final FormState? _form= _formKey.currentState;
    if(_form!.validate()){
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value){
                          if(value!.length < 6){
                            return "Username is too short";
                          }
                          else if(value=="" ){
                            return "Please fill the username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value==""){
                            return "Please fill email";
                          }
                          else if(!regExp.hasMatch(value!)){
                            return "Email is invald";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value){
                          if(value == ""){
                            return "Please fill password";
                          }
                          else if(value!.length < 8){
                            return "Password too short";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() { 
                                obserText=!obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              obserText == true? Icons.visibility:Icons.visibility_off,
                              color: Colors.black,
                              ),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator:(value){
                          if(value==""){
                            return "Please fill your phone number";
                          }
                          else if (value!.length < 11) {
                            return "Phone number must be more 11 ";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Phone number",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text("Register"),
                          color: Colors.blueGrey[400],
                          onPressed: () {
                            validation();
                          }),
                      ),
                      Row(
                        children: <Widget>[
                          Text("I Have an account"),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                           MaterialPageRoute(
                             builder: (ctx) => Login(),
                          ),
                        );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.cyan, 
                              fontSize: 20, 
                              fontWeight: FontWeight.bold),
                              ),
                           ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}