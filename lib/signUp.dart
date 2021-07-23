import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/widget/my_text_field.dart';

class SignUpPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

Widget button(
    {@required String val,
    @required Color color1,
    @required Color color2,
    @required Function onTap}) {
  return RaisedButton(
    onPressed: onTap,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          val,
          textAlign: TextAlign.center,
          style: TextStyle(color: w, fontSize: 20),
        ),
      ),
    ),
  );
}

@override
Color b = Colors.grey[600];
Color w = Colors.white;
bool isSwitched = false;
bool loading = false;

class _SignUpPageState extends State<SignUpPage> {
  RegExp regExp = RegExp(SignUpPage.pattern);
  TextEditingController firstName = TextEditingController();
  TextEditingController lasttName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future senData() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await Firestore.instance.collection('userData').document().setData({
        'firstName': firstName.text.trim(),
        'lastName': lasttName.text.trim(),
        'email': email.text.trim(),
        'password': password.text.trim(),
      });
    } catch (e) {
      if (e.code == 'ERROR_WEAK_PASSWORD') {
        globalKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('weak password !!!',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));
      } else if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        globalKey.currentState.showSnackBar(SnackBar(
            backgroundColor: Colors.grey[200],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('The account is already exist ! ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold))
              ],
            )));
      }
    } 
    catch(e){
      print(e);

      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter Your First Name !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    }
    if (lasttName.text.trim().isEmpty || lasttName.text.trim() == null) {
      globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.grey[200],
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Enter your Last Name !',
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
              Text('Please Enter your Email !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    } else if (!regExp.hasMatch(email.text)) {
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
              Text(' Please Enter your Password !',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            ],
          )));
      return;
    } else {
      setState(() {
        loading = true;
      });
      senData();
    }
  }

  @override
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
                    'Sign Up',
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
                    name: 'First Name',
                    obscure: false,
                    icon: Icons.person,
                    controller: firstName),
                MyTextField(
                    name: 'Last Name',
                    obscure: false,
                    icon: Icons.person,
                    controller: lasttName),
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
              loading
                  ? CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button(
                            onTap: () {},
                            val: 'Cancel',
                            color1: Colors.grey,
                            color2: Colors.pink[100]),
                        SizedBox(
                          width: 40,
                        ),
                        button(
                            onTap: () {
                              validation();
                            },
                            val: 'Register',
                            color1: Colors.pink[100],
                            color2: Colors.red),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
