import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String name;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;
  MyTextField({@required this.name, @required this.obscure,@required this.icon,this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      padding: EdgeInsets.all(15),
      child: TextFormField(
         controller: controller,
         obscureText:obscure,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
            border: OutlineInputBorder(),
            hintText: name,
            hintStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
