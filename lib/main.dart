import 'package:flutter/material.dart';
import 'package:flutter_application/signUp.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializedApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignUpPage());
  }
}
