import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  Widget rect( {@required String name, @required IconData icon }) {
    return Container(
        padding: EdgeInsets.all(15),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(),
            hintText: name,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Column(

        children: [
           SizedBox(
            height:50
          ),
         
          Row(children: [
             IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
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
              color: Colors.black,
            ),
          ),

          ],),
            SizedBox(
            height:50
          ),
          
          Column(children: [
            rect(name: 'User Name', icon:Icons.person),
            rect(name: 'Password',icon: Icons.lock),
          ]),
          SizedBox(
            height: 30,

          ),
        
          RaisedButton(
                onPressed: (){},
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              
            ),
            SizedBox(height: 20,),

            Row(children: [
              SizedBox(width:130),
              Text('Other User ? ',style: TextStyle(color: Colors.black),),
              Text('Register',style: TextStyle(color: Colors.red),),
            ],)

          
        ],
      ),
    );
  }
}
