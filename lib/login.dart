import 'package:flutter/material.dart';
import 'package:flutter_application/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

@override
Color b = Colors.grey[600];
Color w = Colors.white;
bool isSwitched = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: null),
                MyTextField(
                    name: 'Password',
                    obscure: true,
                    icon: Icons.lock,
                    controller: null),
              ]),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {},
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
