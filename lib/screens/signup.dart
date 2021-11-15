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
  Widget _buildAllTextFormField(){
    return Container(
      height: 330,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      mytextformField(
                        name: "UserName",
                        validator: (value){
                          if(value!.length < 6){
                            return "Username is too short";
                          }
                          else if(value=="" ){
                            return "Please fill the username";
                          }
                          return "";
                        },
                      )                      
                      mytextformField(
                       name: "Email",
                       validator: validator: (value){
                         if(value == ""){
                           return "Please fill The Email";
                         }
                         else if(!regExp.hasMatch(value!)){
                           return "Invalid Email";
                         }
                         return "";
                       },
                     ),
                      passwordtextfieldForm(
                       obserText: obserText,
                       name: "Password",
                       validator: (value){
                         if(value == ""){
                           return "Please fill in the Password";
                         }
                         else if(value!.length <8){
                           return "Password it too short";
                         }
                         return null;
                       },
                       onTap: (){
                             FocusScope.of(context).unfocus();
                             setState(() {
                               obserText =!obserText;
                             }
                           );
                          },
                    ),
                    mytextformField(
                      name: "Phone Number",
                      validator: (value){
                          if(value==""){
                            return "Please fill your phone number";
                          }
                          else if (value!.length < 11) {
                            return "Phone number must be more 11 ";
                          }
                          return "";
                        },
                      )
      ]//widget
    );//column
   )
  }
  widget _buildBottomPart(){
    return Container(
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                     _buildAllTextFormField(),
                     mybutton(
                       name: "SignUp",
                       onPressed: (){
                         vaildation();
                        },
                       ), //mybutton
                      ChangeScreeen(
                        name: "Login",
                        whichAccount: "I have already an account!",
                        onTap: (){onTap: () {
                          Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                          builder: (ctx) => Login(),
                          ),
                        );
                        },
                      )//changescreen
                    ],
                  ),
                )
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
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}