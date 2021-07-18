import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

Widget button(
    {@required String val, @required Color color1, @required Color color2}) {
  return RaisedButton(
    onPressed: () {},
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

Widget rect({
  @required String name,
}) {
  return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: name,
            hintStyle: TextStyle(color: b)),
      ));
}

@override
Color b = Colors.grey[600];
Color w = Colors.white;
bool isSwitched = false;

class _SignUpPageState extends State<SignUpPage> {
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
                rect(
                  name: 'Name',
                ),
                rect(name: 'User Name'),
                rect(name: 'Password'),
                rect(name: 'Confirm Password'),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(
                                                mainAxisAlignment:MainAxisAlignment.center,

                children: [
                 
                  button(
                      val: 'Cancel',
                      color1: Colors.grey,
                      color2: Colors.pink[100]),
                  SizedBox(
                    width: 40,
                  ),
                  button(
                      val: 'Register',
                      color1: Colors.pink[100],
                      color2: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
