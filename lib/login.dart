import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginPageState createState() => _LoginPageState();
}

@override
Color b = Colors.grey[600];
Color w = Colors.white;
bool isSwitched = false;
bool loading = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  RegExp regExp = RegExp(LoginPage.pattern);


  @override
  Future loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on AuthException catch (e) {
      if (e.code == 'USER_NOT_FOUND') {
        globalKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No User Found !!',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));
      } else if (e.code == 'WRONG_PASSWORD') {
        globalKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wrong Password !! ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));
            setState(() {
              loading=false;
            });
      }
       setState(() {
              loading=false;
            });
    }
  }

  void validation() {
    if ((email.text.trim().isEmpty || email.text.trim() == null)&&(password.text.trim().isEmpty || password.text.trim() == null)){
      globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All Fields are Empty !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;

    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your Email !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
        else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter a valid Email !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
    }
     if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your passowrd !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    else {
      setState(() {
        loading=true;
      });
      loginUser();
    }

  }
  


  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: w,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: b,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Login In',
                    style: TextStyle(
                      fontSize: 40,
                      color: b,
                    ),
                  ),
                  SizedBox(width: 65),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;

                        b = b == Colors.white ? Colors.grey[600] : Colors.white;
                        w = w == Colors.grey[600]
                            ? Colors.white
                            : Colors.grey[600];
                      });
                    },
                    activeTrackColor: Colors.white70,
                    activeColor: Colors.white70,
                  ),
                ],
              ),
              SizedBox(height: 50),
              Column(children: [
                MyTextField(
                    name: 'Email',
                    obscure: false,
                    icon: Icons.email,
                    controller: email),
                MyTextField(
                    name: 'Password',
                    obscure: true,
                    icon: Icons.lock,
                    controller: password),
              ]),

              SizedBox(
                height: 30,
              ),
              loading? CircularProgressIndicator():
              RaisedButton(
                onPressed: () {
                  validation();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.red],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: w, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Other User ? ',
                    style: TextStyle(color: b),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

