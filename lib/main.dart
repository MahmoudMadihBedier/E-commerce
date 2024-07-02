import 'package:flutter/material.dart';
import 'package:fluttertasks/theminng/colors.dart';


import 'core/auth/login.dart';
import 'core/auth/sinup.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: AppTheme.lightTheme.,
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/SingUp': (context) => SingUpScreen(),
      },
    );
  }
}

