import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Widget button ({@required String name,Color color1 , Color color2,}) {          
               return RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
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
                    constraints:
                        BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
                child: SingleChildScrollView(  
            child: Column(
              children: <Widget>[
                SizedBox(height: 90),
                Container(
                  child: Image.asset('lib/assets/logo.jpg'),
                ),
                SizedBox(height: 50),
               
                Column(children: [
                  Text('Welcome Client',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('Make your own reservation in real time',style:TextStyle(fontSize:16)),
                    SizedBox(height: 30),
                
                  

            
                ],),
                  button(name:'Login' , color1: Color(0xff374ABE), color2 :Color(0xff64B6FF)),
                   SizedBox(height: 15),
                  button(name:'SignUp', color1: Color.fromRGBO(204, 204, 255,1),color2:Color.fromRGBO(230,230,230,1) ),
                        
                  
                
                
              ],
              
            ),
          ),
        ));
  }
}
