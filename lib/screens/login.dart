import 'package:appdevproject/widgets/changeScreen.dart';
import 'package:appdevproject/widgets/mytextformField.dart';
import 'package:appdevproject/widgets/passwordtextformfield.dart';
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
void validation() {
  final FormState? _form = _formKey.currentState;
  if (_form!.validate()) {
    print("Yes");
  } else {
    print("No");
  }
}

bool obserText = true;

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value == "") {
                return "Please fill The Email";
              } else if (!regExp.hasMatch(value!)) {
                return "Invalid Email";
              }
              return null;
            },
          ),
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            validator: (value) {
              if (value == "") {
                return "Please fill in the Password";
              } else if (value!.length < 8) {
                return "Password it too short";
              }
              return null;
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          MyButton(
            onPressed: () {
              validation();
            },
            name: "Login",
          ),
          ChangeScreen(
              name: "SignUp",
              whichAccount: "I dont have account",
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => SignUp(),
                  ),
                );
              }),
        ],
      ),
    );
  }

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
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
