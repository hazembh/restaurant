import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Home.dart';
import 'package:flutter_application/home_page.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializedApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        scaffoldBackgroundColor: Color(0xff2b2b2b),
        appBarTheme: AppBarTheme(color:Color(0xff2b2b2b))

      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (index, sncpshot) {
            if (sncpshot.hasData) {
              return HomePage();
            }
            return LoginPage();
          }),
    );
  }
}
